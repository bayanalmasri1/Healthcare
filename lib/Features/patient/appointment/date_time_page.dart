import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_healthapp/widgets/mainWidget/custom_appbar.dart';

class DateTimePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Select Date & Time',
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Select Date: Nov 23, 2024',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 16.0),
              const Text(
                'Select Time: 4:59 PM',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed("/ServiceCostPage");
                },
                child: Text('Save Selection'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
