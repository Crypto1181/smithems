import 'package:flutter/material.dart';
import '../constants/colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.darkCardBackground,
      child: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(24),
              child: Row(
                children: [
                  Icon(
                    Icons.person,
                    color: AppColors.textWhite,
                    size: 32,
                  ),
                  SizedBox(width: 16),
                  Text(
                    'Menu',
                    style: TextStyle(
                      color: AppColors.textWhite,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: AppColors.textLightGray,
              height: 1,
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                color: AppColors.textWhite,
              ),
              title: const Text(
                'Profile Setting',
                style: TextStyle(
                  color: AppColors.textWhite,
                  fontSize: 16,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/medic-profile-setting');
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.person_add,
                color: AppColors.textWhite,
              ),
              title: const Text(
                'Invite a new user',
                style: TextStyle(
                  color: AppColors.textWhite,
                  fontSize: 16,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/admin-invite');
              },
            ),
          ],
        ),
      ),
    );
  }
}

