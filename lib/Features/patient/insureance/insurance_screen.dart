import 'package:flutter/material.dart';
import 'package:new_healthapp/widgets/insuranceWidget/infocard.dart';
import 'package:new_healthapp/widgets/mainWidget/custom_appbar.dart';

void main() {
  runApp(MaterialApp(
    home: InsuranceCenterScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class InsuranceCenterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(title: 'Insurance Center',actions: [
        IconButton(onPressed: (){}, icon:const Icon( Icons.edit))
      ],) ,
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Personal Information Section
              InfoCard(
                title: "Personal Information",
                data: {
                  "First Name": "John",
                  "Middle Name": "Michael",
                  "Last Name": "Doe",
                  "Date of Birth": "01/01/1980",
                  "Gender": "Male",
                  "Contact Email": "john.doe@example.com",
                  "Contact Phone": "+1 234 567 890",
                  "Address": "123 Main St, City, Country",
                },
              ),
              SizedBox(height: 20),
              // Insurance Information Section
              InfoCard(
                title: "Insurance Information",
                data: {
                  "Insurance Name": "HealthCare Plus",
                  "Member ID": "123456789",
                  "Family ID": "987654321",
                  "Policy Number": "INS-0012345",
                  "Group Number": "GRP-54321",
                  "Patient Co-pay": "20%",
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

