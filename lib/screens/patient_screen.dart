import 'package:flutter/material.dart';
import 'package:new_healthapp/widgets/mainWidget/navigation_bar.dart';
import 'package:new_healthapp/widgets/patientWidget/Activemidication.dart';
import 'package:new_healthapp/widgets/patientWidget/costum_container.dart';
import 'package:new_healthapp/widgets/patientWidget/icon_containar.dart';
import 'package:new_healthapp/widgets/patientWidget/infowidget.dart';

class PatientScreen extends StatefulWidget {
  @override
  _PatientScreenState createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  int _currentIndex = 0; // التحكم بالصفحات.

  // الأقسام المرتبطة بشريط التنقل.
  final List<Widget> _sections = [
    HomeSection(),
    SearchSection(),
    FavoritesSection(),
    ProfileSection(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _sections[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class HomeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        bottom: false,
        child: Expanded(
          child: Column(
            children: [
              Stack(children: [
                custom_containar(),
                 
                  Padding(
                    padding: const EdgeInsets.only(top: 140,bottom: 0),
                    child: container_Icons(),
                  ),
                ]),
                Info_widgets(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ActiveMedicinesWidget(),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class SearchSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Search Section',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class FavoritesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Favorites Section',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Profile Section',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
