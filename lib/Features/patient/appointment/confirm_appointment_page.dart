import 'package:flutter/material.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://via.placeholder.com/300x150', // Replace with actual image
              height: 150.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16.0),
            Text(
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
                onPressed: () {
                  // Action to finalize booking
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
