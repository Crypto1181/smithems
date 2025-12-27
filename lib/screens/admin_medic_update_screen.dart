import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/bottom_nav_bar.dart';
import 'client_dashboard_screen.dart';
import 'medic_schedule_hub_screen.dart';
import 'medic_profile_setting_screen.dart';
import 'messages_list_screen.dart';
import 'admin_reports_dashboard_screen.dart';

class AdminMedicUpdateScreen extends StatefulWidget {
  const AdminMedicUpdateScreen({super.key});

  @override
  State<AdminMedicUpdateScreen> createState() => _AdminMedicUpdateScreenState();
}

class _AdminMedicUpdateScreenState extends State<AdminMedicUpdateScreen> {
  final TextEditingController _updateController = TextEditingController();
  bool _prioritizeUpdate = false;
  DateTime? _scheduledDate;
  int _currentNavIndex = 3;

  @override
  void dispose() {
    _updateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Compose Update'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.darkCardBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: _updateController,
                  maxLines: 8,
                  style: const TextStyle(color: AppColors.textWhite),
                  decoration: const InputDecoration(
                    hintText: 'Write your Update here',
                    hintStyle: TextStyle(color: AppColors.textLightGray),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(
                    icon: Icons.image,
                    label: 'Add Image',
                    onTap: () {
                      // Handle add image
                    },
                  ),
                  _buildActionButton(
                    icon: Icons.link,
                    label: 'Insert Link',
                    onTap: () {
                      // Handle insert link
                    },
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Text(
                'Options',
                style: TextStyle(
                  color: AppColors.textWhite,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Prioritize Update',
                    style: TextStyle(
                      color: AppColors.textWhite,
                      fontSize: 16,
                    ),
                  ),
                  Switch(
                    value: _prioritizeUpdate,
                    onChanged: (value) {
                      setState(() {
                        _prioritizeUpdate = value;
                      });
                    },
                    activeColor: AppColors.primaryRed,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Schedule Update',
                    style: TextStyle(
                      color: AppColors.textWhite,
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(const Duration(days: 365)),
                        builder: (context, child) {
                          return Theme(
                            data: ThemeData.dark(),
                            child: child!,
                          );
                        },
                      );
                      if (date != null) {
                        setState(() {
                          _scheduledDate = date;
                        });
                      }
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.darkCardBackground,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: _scheduledDate != null
                            ? Text(
                                '${_scheduledDate!.day}',
                                style: const TextStyle(
                                  color: AppColors.textWhite,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : const Icon(
                                Icons.calendar_today,
                                color: AppColors.textWhite,
                                size: 24,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to Admin Reports Dashboard
                    Navigator.pushReplacementNamed(context, '/admin-reports-dashboard');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryRed,
                    foregroundColor: AppColors.textWhite,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Publish Update'),
                ),
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
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => const AdminReportsDashboardScreen(),
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

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.darkCardBackground,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: AppColors.textWhite,
              size: 28,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textWhite,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

