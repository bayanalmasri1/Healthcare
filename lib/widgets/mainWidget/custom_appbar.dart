import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;

  CustomAppBar({required this.title, this.actions, this.bottom});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white, // لون النص لتناقض مع الخلفية
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      bottom: bottom,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_ios_new_outlined,
          color: Colors.white, // لون الأيقونة
        ),
        onPressed: () {
          Get.back();
        },
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      actions: actions, // إضافة الأكشن المخصص (مثل زر التعديل)
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
