import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/bottom_nav_bar.dart';
import 'client_dashboard_screen.dart';
import 'medic_schedule_hub_screen.dart';
import 'medic_profile_setting_screen.dart';
import 'messages_list_screen.dart';
import 'admin_reports_dashboard_screen.dart';

class UtilizationReportsDetailsScreen extends StatefulWidget {
  const UtilizationReportsDetailsScreen({super.key});

  @override
  State<UtilizationReportsDetailsScreen> createState() => _UtilizationReportsDetailsScreenState();
}

class _UtilizationReportsDetailsScreenState extends State<UtilizationReportsDetailsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentNavIndex = 3;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 2);
  }

  @override
  void dispose() {
    _tabController.dispose();
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
        title: const Text('Utilization Reports'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 24, bottom: 16),
                  child: Text(
                    'View More',
                    style: TextStyle(
                      color: AppColors.textWhite,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              TabBar(
                controller: _tabController,
                indicatorColor: AppColors.textWhite,
                labelColor: AppColors.textWhite,
                unselectedLabelColor: AppColors.textLightGray,
                tabs: const [
                  Tab(text: 'Overview'),
                  Tab(text: 'Details'),
                  Tab(text: 'Trends'),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: _buildFilterButton('Certification'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildFilterButton('Event Type'),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildFilterButton('Medic'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              TabBarView(
                controller: _tabController,
                children: [
                  _buildOverviewTab(),
                  _buildDetailsTab(),
                  _buildTrendsTab(),
                ],
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

  Widget _buildFilterButton(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.darkCardBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textWhite,
              fontSize: 14,
            ),
          ),
          const Icon(
            Icons.arrow_drop_down,
            color: AppColors.textWhite,
            size: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewTab() {
    return const Column(
      children: [
        Text(
          'Overview content',
          style: TextStyle(color: AppColors.textWhite),
        ),
      ],
    );
  }

  Widget _buildDetailsTab() {
    return const Column(
      children: [
        Text(
          'Details content',
          style: TextStyle(color: AppColors.textWhite),
        ),
      ],
    );
  }

  Widget _buildTrendsTab() {
    return Column(
      children: [
        _buildPerformanceCard(
          title: 'Medic Performance',
          percentage: '85%',
          period: 'Last 30 Days',
          change: '+5%',
          isPositive: true,
          chartType: 'bar',
        ),
        const SizedBox(height: 20),
        _buildPerformanceCard(
          title: 'Utilization Trends',
          percentage: '12%',
          period: 'Last 90 Days',
          change: '-2%',
          isPositive: false,
          chartType: 'line',
        ),
        const SizedBox(height: 40),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Handle export
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryRed,
                  foregroundColor: AppColors.textWhite,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Export Detailed Report'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Handle print
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkCardBackground,
                  foregroundColor: AppColors.textWhite,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Print'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPerformanceCard({
    required String title,
    required String percentage,
    required String period,
    required String change,
    required bool isPositive,
    required String chartType,
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
              color: AppColors.textWhite,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            percentage,
            style: const TextStyle(
              color: AppColors.textWhite,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                period,
                style: const TextStyle(
                  color: AppColors.textLightGray,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                change,
                style: TextStyle(
                  color: isPositive ? Colors.green : AppColors.primaryRed,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          if (chartType == 'bar')
            _buildBarChart()
          else
            _buildLineChart(),
        ],
      ),
    );
  }

  Widget _buildBarChart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildBar('Medic A', 0.7),
        _buildBar('Medic B', 0.8),
        _buildBar('Medic C', 0.75),
      ],
    );
  }

  Widget _buildBar(String label, double height) {
    return Column(
      children: [
        Container(
          width: 40,
          height: 100 * height,
          decoration: BoxDecoration(
            color: AppColors.darkCardBackground.withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textLightGray,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildLineChart() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: AppColors.darkBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: Text(
          'Line Chart',
          style: TextStyle(
            color: AppColors.textLightGray,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

