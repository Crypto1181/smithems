import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/app_drawer.dart';
import 'client_dashboard_screen.dart';
import 'medic_profile_setting_screen.dart';
import 'admin_payroll_screen.dart';
import 'messages_list_screen.dart';

class MedicScheduleHubScreen extends StatefulWidget {
  const MedicScheduleHubScreen({super.key});

  @override
  State<MedicScheduleHubScreen> createState() => _MedicScheduleHubScreenState();
}

class _MedicScheduleHubScreenState extends State<MedicScheduleHubScreen> {
  int _currentNavIndex = 1;
  final List<Map<String, dynamic>> _availableShifts = [
    {'id': 1, 'title': 'Patient Transfer', 'time': '10:00 AM - 12:00 PM', 'date': '12', 'claimed': false},
    {'id': 2, 'title': 'Lunch Break', 'time': '12:00 PM - 1:00 PM', 'date': '12', 'claimed': false},
    {'id': 3, 'title': 'Patient Transfer', 'time': '1:00 PM - 3:00 PM', 'date': '12', 'claimed': false},
    {'id': 4, 'title': 'Patient Transfer', 'time': '3:00 PM - 5:00 PM', 'date': '12', 'claimed': false},
  ];
  final List<Map<String, dynamic>> _myShifts = [
    {'id': 5, 'title': 'Patient Transfer', 'time': '10:00 AM - 12:00 PM', 'date': '12'},
    {'id': 6, 'title': 'Lunch Break', 'time': '12:00 PM - 1:00 PM', 'date': '12'},
    {'id': 7, 'title': 'Patient Transfer', 'time': '1:00 PM - 3:00 PM', 'date': '12'},
    {'id': 8, 'title': 'Patient Transfer', 'time': '3:00 PM - 5:00 PM', 'date': '12'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      drawer: const AppDrawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: const Text('Schedule'),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () {
              Navigator.pushNamed(context, '/calendar-view');
            },
            tooltip: 'Calendar View',
          ),
          IconButton(
            icon: const Icon(Icons.access_time),
            onPressed: () {
              Navigator.pushNamed(context, '/time-tracking');
            },
            tooltip: 'Time Tracking',
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'My Schedule',
                style: TextStyle(
                  color: AppColors.textWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ..._myShifts.map((shift) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _buildScheduleItem(
                      shift['title'],
                      shift['time'],
                      date: shift['date'],
                      isMyShift: true,
                    ),
                  )),
              const SizedBox(height: 40),
              const Text(
                'Available Shifts',
                style: TextStyle(
                  color: AppColors.textWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ..._availableShifts.map((shift) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _buildAvailableShiftItem(shift),
                  )),
              const SizedBox(height: 20),
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
          // Navigate to different screens based on index
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
              // Already on Schedule
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
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => const AdminPayrollScreen(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              );
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

  void _claimShift(int shiftId) {
    setState(() {
      final shift = _availableShifts.firstWhere((s) => s['id'] == shiftId);
      shift['claimed'] = true;
      _myShifts.add(shift);
      _availableShifts.remove(shift);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Shift claimed successfully!'),
        backgroundColor: AppColors.accentGreen,
      ),
    );
  }

  Widget _buildScheduleItem(String title, String time, {String? date, bool isMyShift = false}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.darkCardBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.darkBackground,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.calendar_today,
                  color: AppColors.textWhite,
                  size: 20,
                ),
                Text(
                  date ?? '12',
                  style: const TextStyle(
                    color: AppColors.textWhite,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.textWhite,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: const TextStyle(
                    color: AppColors.textLightGray,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvailableShiftItem(Map<String, dynamic> shift) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.darkCardBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.darkBackground,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.calendar_today,
                  color: AppColors.textWhite,
                  size: 20,
                ),
                Text(
                  shift['date'],
                  style: const TextStyle(
                    color: AppColors.textWhite,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shift['title'],
                  style: const TextStyle(
                    color: AppColors.textWhite,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  shift['time'],
                  style: const TextStyle(
                    color: AppColors.textLightGray,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => _claimShift(shift['id']),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryRed,
              foregroundColor: AppColors.textWhite,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Claim'),
          ),
        ],
      ),
    );
  }
}

