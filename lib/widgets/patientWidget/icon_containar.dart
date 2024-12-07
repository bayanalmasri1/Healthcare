import 'package:flutter/material.dart';
import 'package:get/get.dart';



class container_Icons extends StatelessWidget {


  final List<Map<String, dynamic>> items = [
    {
      'image': 'assets/images/Insurance.png',
      'title': 'Insurance',
      'route': "/insurance"
    },
    {
      'image': 'assets/images/appointment.png',
      'title': 'Appointment',
      'route': "/appointment"
    },
    {
      'image': 'assets/images/MedicalRecord.png',
      'title': 'Medical Record',
      'route': "/miecalrecord"
    },
    {
      'image': 'assets/images/FamilyMembers.png',
      'title': 'Family Members',
      'route': "/familymember"
    },
    {
      'image': 'assets/images/Medications.png',
      'title': 'Medication',
      'route': "/medication"
    },
    {
      'image': 'assets/images/Claims.png',
      'title': 'Claims',
      'route': "/Claims"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 400,
        height: 200,
       margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
            // CustomPaint خلف GridView
            CustomPaint(
              size: Size(double.infinity, 220),
              painter: GridLinesPainter(),
            ),
            // إحاطة GridView بـ GestureDetector
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return _buildGridItem(items[index]);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(Map<String, dynamic> item) {
    return Column(
      children: [
        IconButton(
          icon: Image.asset(
            item['image'],
            width: 40,
            height: 40,
            fit: BoxFit.contain,
            color: Colors.blueAccent, // اختيار اللون للأيقونة إذا لزم الأمر
          ),
          onPressed: () {
            Get.toNamed(item['route']);
          },
        ),
     //   const SizedBox(height: 8),
        Text(
          item['title'],
          style: const TextStyle(
            color: Colors.black,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class GridLinesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint linePaint = Paint()
      ..color = Colors.grey.withOpacity(0.4)
      ..strokeWidth = 1;

    double cellWidth = size.width / 3;
    double cellHeight = size.height / 2;

    // رسم الخطوط العمودية
    for (int i = 1; i < 3; i++) {
      canvas.drawLine(
        Offset(cellWidth * i, 0),
        Offset(cellWidth * i, size.height),
        linePaint,
      );
    }

    // رسم الخطوط الأفقية
    for (int i = 1; i < 2; i++) {
      canvas.drawLine(
        Offset(0, cellHeight * i),
        Offset(size.width, cellHeight * i),
        linePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
