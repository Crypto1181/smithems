import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/bottom_nav_bar.dart';
import 'client_dashboard_screen.dart';
import 'medic_schedule_hub_screen.dart';
import 'medic_profile_setting_screen.dart';
import 'messages_list_screen.dart';

class AdminReportsDashboardScreen extends StatefulWidget {
  const AdminReportsDashboardScreen({super.key});

  @override
  State<AdminReportsDashboardScreen> createState() => _AdminReportsDashboardScreenState();
}

class _AdminReportsDashboardScreenState extends State<AdminReportsDashboardScreen> {
  int _currentNavIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Handle menu
          },
        ),
        title: const Text('Reports'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Overview',
                style: TextStyle(
                  color: AppColors.textWhite,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _buildOverviewCard(
                      title: 'Total Shifts',
                      value: '1,250',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildOverviewCard(
                      title: 'Average Response Time',
                      value: '7 min',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _buildOverviewCard(
                title: 'Incidents Reported',
                value: '320',
              ),
              const SizedBox(height: 40),
              const Text(
                'Reports',
                style: TextStyle(
                  color: AppColors.textWhite,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _buildReportCard(
                title: 'Shift History',
                actionText: 'View Shift History',
                description: 'Access detailed records of all shifts completed by medics.',
                buttonText: 'View →',
                onTap: () {
                  // Navigate to shift history
                },
              ),
              const SizedBox(height: 16),
              _buildReportCard(
                title: 'Utilization',
                actionText: 'View Utilization Reports',
                description: 'Analyze resource utilization and efficiency metrics.',
                buttonText: 'View →',
                onTap: () {
                  Navigator.pushNamed(context, '/utilization-reports-details');
                },
              ),
              const SizedBox(height: 16),
              _buildReportCard(
                title: 'Payroll Export',
                actionText: 'Export Payroll Data',
                description: 'Generate payroll reports for accounting and payment processing.',
                buttonText: 'Export →',
                onTap: () {
                  Navigator.pushNamed(context, '/admin-payroll');
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentNavIndex,
        onTap: (index) {
          setState(() {
            _currentNavIndex = index;
          });
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => const ClientDashboardScreen(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => const MedicScheduleHubScreen(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => const MedicProfileSettingScreen(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              );
              break;
            case 3:
              // Already on Reports
              break;
            case 4:
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => const MessagesListScreen(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              );
              break;
          }
        },
      ),
    );
  }

  Widget _buildOverviewCard({
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.darkCardBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: AppColors.textLightGray,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.textWhite,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReportCard({
    required String title,
    required String actionText,
    required String description,
    required String buttonText,
    required VoidCallback onTap,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.darkCardBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textLightGray,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  actionText,
                  style: const TextStyle(
                    color: AppColors.textWhite,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    color: AppColors.textLightGray,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: onTap,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.darkBackground,
                    foregroundColor: AppColors.textWhite,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(buttonText),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: AppColors.darkBackground,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.image,
              color: AppColors.textLightGray,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}

