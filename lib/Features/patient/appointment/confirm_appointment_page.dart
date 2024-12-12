import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConfirmAppointmentPage extends StatelessWidget {
  // دالة للتحقق من الاتصال بالإنترنت
  Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }

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
                  bool connected = await isConnected();
                  if (connected) {
                    // عرض مؤشر تحميل أثناء الإرسال
                    showDialog(
                      context: context,
                      builder: (context) => Center(child: CircularProgressIndicator()),
                    );

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
                      await FirebaseFirestore.instance.collection('accept_appointment').add(appointmentDetails);
                      Navigator.pop(context); // إغلاق مؤشر التحميل
                      Get.offAllNamed("/Login", arguments: appointmentDetails);
                    } catch (e) {
                      Navigator.pop(context); // إغلاق مؤشر التحميل
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Failed to send appointment: $e')),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('No internet connection')),
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
