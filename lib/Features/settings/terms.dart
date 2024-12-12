import 'package:flutter/material.dart';
import 'package:new_healthapp/widgets/mainWidget/custom_appbar.dart';

class TermsOfServiceScreen extends StatelessWidget {
  const TermsOfServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Terms of Service',
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.5),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16.0),
          child: const SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Terms of Service",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "1. Introduction",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "By using our app, you agree to be bound by these Terms of Service. Please read them carefully.",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  "2. User Responsibilities",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Users are expected to use the app responsibly and comply with all applicable laws. You agree not to misuse our services.",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  "3. Account Security",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "You are responsible for safeguarding your account credentials. Please notify us immediately of any unauthorized use.",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  "4. Limitation of Liability",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "We are not liable for any damages resulting from the use of our app. The app is provided on an 'as-is' basis.",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  "5. Termination",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "We reserve the right to suspend or terminate your access to the app if you violate these Terms of Service.",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  "6. Changes to Terms",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "We may update these Terms of Service from time to time. Your continued use of the app after changes indicates acceptance.",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Text(
                  "7. Contact Us",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "If you have any questions or concerns about these Terms of Service, please contact us at support@example.com.",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
