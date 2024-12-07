import 'package:flutter/material.dart';
import 'package:new_healthapp/widgets/mainWidget/custom_appbar.dart';
import 'package:new_healthapp/model/familymember_list.dart';


class FamilyMember extends StatelessWidget {
  const FamilyMember({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Family Member'),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount:
            FamilyMemberModel.familyMembers.length, 
        itemBuilder: (context, index) {
          final member =
              FamilyMemberModel.familyMembers[index]; 
          return _buildCard(
            name: member['name']!,
            relation: member['relation']!,
            age: member['age']!,
            id: member['id']!,
            imagePath: member['imagePath']!,
          );
        },
      ),
    );
  }

  Widget _buildCard({
    required String name,
    required String relation,
    required String age,
    required String id,
    required String imagePath,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          radius: 28,
          backgroundColor: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: 50,
              height: 50,
            ),
          ),
        ),
        title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Relationship: $relation'),
            Text('Age: $age'),
            Text('Member ID: $id'),
          ],
        ),
        isThreeLine: true,
        onTap: () {
          // Handle tap
        },
      ),
    );
  }
}
