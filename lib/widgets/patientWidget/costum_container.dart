import 'package:flutter/material.dart';

void main (){
  runApp(MaterialApp(home: custom_containar()));
}

class custom_containar extends StatelessWidget {
  const custom_containar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 200, // ارتفاع الحاوية الملونة.
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 127, 68, 255), Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: const Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 25,
              child: Icon(Icons.person, color: Colors.blueAccent),
            ),
            SizedBox(width: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi Deyya,",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Welcome back!",
                  style: TextStyle(color: Colors.white),
                ), 
               
              ],
            ),
          ],
        ),
      ),
    );
  }
}
