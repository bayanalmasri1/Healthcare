import 'package:flutter/material.dart';
import 'package:new_healthapp/Features/patient/appointment/consultation_type_page.dart';


class ChooseFamilyMemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Family Member'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          FamilyMemberCard(name: 'Ali Ahmed', relationship: 'Father', age: 60),
          FamilyMemberCard(name: 'Layla Yusuf', relationship: 'Mother', age: 56),
          FamilyMemberCard(name: 'Omar Khaled', relationship: 'Brother', age: 25),
        ],
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
      margin: EdgeInsets.symmetric(vertical: 8.0),
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
