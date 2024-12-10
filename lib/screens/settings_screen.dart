import 'package:flutter/material.dart';
import 'package:new_healthapp/widgets/mainWidget/custom_appbar.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Settings',
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildListTile(
              context,
              icon: Icons.info,
              title: 'About Us',
              onTap: () {},
            ),
            _buildListTile(
              context,
              icon: Icons.privacy_tip,
              title: 'Privacy Policy',
              onTap: () {},
            ),
            _buildListTile(
              context,
              icon: Icons.article,
              title: 'Terms of Service',
              onTap: () {},
            ),
            SwitchListTile(
              value: true,
              onChanged: (bool value) {},
              title: Row(
                children: [
                  Icon(Icons.notifications, color: Colors.orange),
                  SizedBox(width: 16),
                  Text('Notifications'),
                ],
              ),
            ),
            _buildListTile(
              context,
              icon: Icons.help,
              title: 'Help & Support',
              onTap: () {},
            ),
            _buildListTile(
              context,
              icon: Icons.logout,
              title: 'Sign Out',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(BuildContext context,
      {required IconData icon,
      required String title,
      required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).primaryColor),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
