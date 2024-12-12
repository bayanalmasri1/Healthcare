import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_healthapp/Features/patient/appointment/consultation_type_page.dart';

class ChooseFamilyMemberPage extends StatelessWidget {
  Future<List<Map<String, dynamic>>> fetchFamilyMembers() async {
    try {
      // Fetch family members from Firestore
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('family_members').get();

      // Convert documents to list of maps
      return snapshot.docs.map((doc) {
        return {
          'name': doc['name'] ?? 'N/A',
          'relationship': doc['relationship'] ?? 'N/A',
          'age': doc['age'] ?? 'N/A', // Ensure 'age' is an int in Firestore
        };
      }).toList();
    } catch (e) {
      throw Exception("Error fetching family members: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Family Member'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchFamilyMembers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No family members found."));
          } else {
            final familyMembers = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: familyMembers.length,
              itemBuilder: (context, index) {
                final member = familyMembers[index];
                return FamilyMemberCard(
                  name: member['name'],
                  relationship: member['relationship'],
                  age: member['age'] is int
                      ? member['age']
                      : int.tryParse(member['age'].toString()) ??
                          0, // Ensure age is int
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ConsultationTypePage()),
            );
          },
          child: Text('Next: Select Visit Type'),
        ),
      ),
    );
  }
}

class FamilyMemberCard extends StatelessWidget {
  final String name;
  final String relationship;
  final int age;

  const FamilyMemberCard({
    required this.name,
    required this.relationship,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(Icons.person),
        ),
        title: Text(name),
        subtitle: Text('Relationship: $relationship\nAge: $age'),
      ),
    );
  }
}