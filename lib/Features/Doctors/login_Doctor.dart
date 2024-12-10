import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_healthapp/Features/Doctors/doctor_hospital.dart';

class LoginDoctorPage extends StatefulWidget {
  @override
  _LoginDoctorPageState createState() => _LoginDoctorPageState();
}

class _LoginDoctorPageState extends State<LoginDoctorPage> {
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';

  Future<void> _loginDoctor() async {
    try {
      // تسجيل الدخول
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // الحصول على uid للطبيب
      String doctorId = userCredential.user!.uid;

      // جلب بيانات الدكتور من Firestore
      DocumentSnapshot doctorData = await FirebaseFirestore.instance
          .collection('doctors')
          .doc(doctorId)
          .get();

      print('Welcome, ${doctorData['name']}!');

      // الانتقال إلى صفحة المستشفيات مع تمرير uid
     Get.toNamed("/DoctorScreen");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Email'),
              onChanged: (value) => email = value,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
              onChanged: (value) => password = value,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _loginDoctor,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
