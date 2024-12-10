import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:new_healthapp/widgets/mainWidget/custom_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
          
              Container(
                height: 300,
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 127, 68, 255),
                      Colors.lightBlueAccent
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
              Positioned(
                top: 100,
                left: 16,right: 16,
                child: Image.asset("assets/images/logo.png")),
                const Center(
                  child:  Positioned(
                    top: 110,
                    child: Text(
                            "Healthy Guard",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: CustomButton(
                text: "Doctors",
                onPressed: () {
                  Get.toNamed("/DoctorScreen");
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: CustomButton(
                text: "Patinat",
                onPressed: () {
                  Get.toNamed("/login");
                }),
          ),
          IconButton(onPressed: (){}, icon:Icon (Icons.help))
        ],
      ),
    );
  }
}