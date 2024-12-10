import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_healthapp/widgets/mainWidget/custom_appbar.dart';

class RegisterDoctorPage extends StatefulWidget {
  @override
  _RegisterDoctorPageState createState() => _RegisterDoctorPageState();
}

class _RegisterDoctorPageState extends State<RegisterDoctorPage> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';
  String specialty = '';

  Future<void> _registerDoctor() async {
    if (_formKey.currentState!.validate()) {
      try {
        // إنشاء حساب جديد
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // الحصول على uid للدكتور
        String doctorId = userCredential.user!.uid;

        // تخزين بيانات الدكتور في Firestore
        await _firestore.collection('doctors').doc(doctorId).set({
          'name': name,
          'email': email,
          'specialty': specialty,
        });

        // التنقل إلى صفحة أخرى بعد النجاح
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Doctor registered successfully!')),
        );
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title:'Register Doctor'
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
                onChanged: (value) => name = value,
                validator: (value) => value!.isEmpty ? 'Enter a name' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
                onChanged: (value) => email = value,
                validator: (value) =>
                    value!.isEmpty ? 'Enter a valid email' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                onChanged: (value) => password = value,
                validator: (value) =>
                    value!.length < 6 ? 'Password must be at least 6 characters' : null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Specialty'),
                onChanged: (value) => specialty = value,
                validator: (value) =>
                    value!.isEmpty ? 'Enter a specialty' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _registerDoctor,
                child: Text('Register'),
              ),
              ElevatedButton(
                onPressed: (){
                  Get.toNamed("/LoginDoctorPage");
                },
                child: Text('Login'),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
