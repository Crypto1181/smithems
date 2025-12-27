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
            Expanded(
              child: ListView(
                children: [
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
                  ListTile(
                    leading: const Icon(
                      Icons.people,
                      color: AppColors.textWhite,
                    ),
                    title: const Text(
                      'User Management',
                      style: TextStyle(
                        color: AppColors.textWhite,
                        fontSize: 16,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/admin-user-management');
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.notifications,
                      color: AppColors.textWhite,
                    ),
                    title: const Text(
                      'Notifications',
                      style: TextStyle(
                        color: AppColors.textWhite,
                        fontSize: 16,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      // Navigate to notifications if needed
                    },
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.help_outline,
                      color: AppColors.textWhite,
                    ),
                    title: const Text(
                      'Help & Support',
                      style: TextStyle(
                        color: AppColors.textWhite,
                        fontSize: 16,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      // Navigate to help if needed
                    },
                  ),
                  const Divider(
                    color: AppColors.textLightGray,
                    height: 1,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.logout,
                      color: AppColors.primaryRed,
                    ),
                    title: const Text(
                      'Log Out',
                      style: TextStyle(
                        color: AppColors.primaryRed,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      // Show confirmation dialog
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: AppColors.darkCardBackground,
                            title: const Text(
                              'Log Out',
                              style: TextStyle(color: AppColors.textWhite),
                            ),
                            content: const Text(
                              'Are you sure you want to log out?',
                              style: TextStyle(color: AppColors.textLightGray),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(color: AppColors.textLightGray),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  // Navigate to login screen
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    '/login',
                                    (route) => false,
                                  );
                                },
                                child: const Text(
                                  'Log Out',
                                  style: TextStyle(color: AppColors.primaryRed),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

