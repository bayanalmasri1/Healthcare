import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_healthapp/core/auth_service.dart';
import 'package:new_healthapp/widgets/mainWidget/custom_button.dart';

class Align_login extends StatelessWidget {
  const Align_login({
    super.key,
    required AuthService authService,
  }) : _authService = authService;

  final AuthService _authService;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 32, // حجم النص
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: 'Wel', // الجزء الأول
                        style: TextStyle(
                            color: Colors.purple), // اللون الأول
                      ),
                      TextSpan(
                        text: 'come', // الجزء الثاني
                        style:
                            TextStyle(color: Colors.blue), // اللون الثاني
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'National ID Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              CustomButton(
                text: "Login",
                onPressed: () {
                  Get.toNamed("/patient");
                },
              ),
              SizedBox(height: 10),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot your password?",
                    style: TextStyle(color: Colors.purple),
                  ),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.facebook, color: Colors.blue),
                    onPressed: () async {
                      final user =
                          await _authService.signInWithFacebook();
                      if (user != null) {
                        print(
                            'Logged in with Facebook: ${user.displayName}');
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.g_mobiledata, color: Colors.red),
                    onPressed: () async {
                      final user = await _authService.signInWithGoogle();
                      if (user != null) {
                        print(
                            'Logged in with Google: ${user.displayName}');
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
