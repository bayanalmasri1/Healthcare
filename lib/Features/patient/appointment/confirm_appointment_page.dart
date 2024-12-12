import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ConfirmAppointmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step 4 of 4: Confirm Your Choices'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              'https://via.placeholder.com/300x150', // Replace with actual image
              height: 150.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            const Text(
              'Jordan Hospital',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text('Location: Shmeisani'),
            Text('Service: General Care'),
            Text('Doctor: Dr. Mahmud Jarwan'),
            SizedBox(height: 16.0),
            Text('Date: 23-10-2024'),
            Text('Time: 8:00 AM - 9:00 AM'),
            SizedBox(height: 16.0),
            Text('Patient: Ahmed Khaled'),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  final appointmentDetails = {
                    'hospital': 'Jordan Hospital',
                    'location': 'Shmeisani',
                    'service': 'General Care',
                    'doctor': 'Dr. Mahmud Jarwan',
                    'date': '23-10-2024',
                    'time': '8:00 AM - 9:00 AM',
                    'patient': 'Ahmed Khaled',
                    'status': 'pending', // Default status
                  };

                  try {
                    await FirebaseFirestore.instance
                        .collection('accept_appointment')
                        .add(appointmentDetails);
                    Get.offAllNamed("/Login", arguments: appointmentDetails);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to send appointment: $e')),
                    );
                  }
                },
                child: Text('Finalize Appointment'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
