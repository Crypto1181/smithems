import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants/theme.dart';
import 'screens/homepage_screen.dart';
import 'screens/login_screen.dart';
import 'screens/role_selection_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/account_verification_screen.dart';
import 'screens/password_setup_screen.dart';
import 'screens/admin_invite_screen.dart';
import 'screens/client_profile_setup_screen.dart';
import 'screens/client_venue_details_screen.dart';
import 'screens/client_dashboard_screen.dart';
import 'screens/client_medic_profile_screen.dart';
import 'screens/conversation_inbox_screen.dart';
import 'screens/medic_profile_setup_screen.dart';
import 'screens/medic_profile_setting_screen.dart';
import 'screens/medic_schedule_hub_screen.dart';
import 'screens/admin_payroll_screen.dart';
import 'screens/admin_user_management_screen.dart';
import 'screens/admin_inactive_users_screen.dart';
import 'screens/messages_list_screen.dart';
import 'screens/calendar_view_screen.dart';
import 'screens/time_tracking_screen.dart';
import 'screens/shift_request_screen.dart';
import 'screens/edit_shift_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smith EMS',
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomepageScreen(),
        '/login': (context) => const LoginScreen(),
        '/role-selection': (context) => const RoleSelectionScreen(),
        '/registration': (context) => const RegistrationScreen(),
        '/account-verification': (context) => const AccountVerificationScreen(),
        '/password-setup': (context) => const PasswordSetupScreen(),
        '/admin-invite': (context) => const AdminInviteScreen(),
        '/client-profile-setup': (context) => const ClientProfileSetupScreen(),
        '/client-venue-details': (context) => const ClientVenueDetailsScreen(),
        '/client-dashboard': (context) => const ClientDashboardScreen(),
        '/client-medic-profile': (context) => const ClientMedicProfileScreen(),
        '/conversation-inbox': (context) => const ConversationInboxScreen(),
        '/medic-profile-setup': (context) => const MedicProfileSetupScreen(),
        '/medic-profile-setting': (context) => const MedicProfileSettingScreen(),
        '/medic-schedule-hub': (context) => const MedicScheduleHubScreen(),
        '/admin-payroll': (context) => const AdminPayrollScreen(),
        '/admin-user-management': (context) => const AdminUserManagementScreen(),
        '/admin-inactive-users': (context) => const AdminInactiveUsersScreen(),
        '/messages-list': (context) => const MessagesListScreen(),
        '/calendar-view': (context) => const CalendarViewScreen(),
        '/time-tracking': (context) => const TimeTrackingScreen(),
        '/shift-request': (context) => const ShiftRequestScreen(),
        '/edit-shift': (context) => const EditShiftScreen(),
      },
    );
  }
}
