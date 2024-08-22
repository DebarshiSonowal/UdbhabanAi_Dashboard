import 'package:smart_admin_dashboard/responsive.dart';
import 'package:smart_admin_dashboard/screens/analytics/analytics_screen.dart';
import 'package:smart_admin_dashboard/screens/communication/communication_screen.dart';

// import 'package:smart_admin_dashboard/screens/appointments/appointment_screen.dart';
import 'package:smart_admin_dashboard/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:smart_admin_dashboard/screens/grievances_redressal/grievances_redressal_screen.dart';
import 'package:smart_admin_dashboard/screens/leads/leads_screen.dart';

import '../accounts/accounts_screen.dart';
import '../customers/customers_screen.dart';
import '../settings/settings_screen.dart';
import 'components/side_menu.dart';

class HomeScreen extends StatelessWidget {
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, _) {
        return Scaffold(
          //key: context.read<MenuController>().scaffoldKey,
          drawer: SideMenu(
            controller: pageController,
          ),
          body: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // We want this side menu only for large screen
                if (Responsive.isDesktop(context))
                  Expanded(
                    // default flex = 1
                    // and it takes 1/6 part of the screen
                    child: SideMenu(
                      controller: pageController,
                    ),
                  ),
                Expanded(
                  // It takes 5/6 part of the screen
                  flex: 5,
                  child: PageView(
                    controller: pageController,
                    children: [
                      DashboardScreen(),
                      LeadsScreen(),
                      CustomersScreen(),
                      AnalyticsScreen(),
                      CommunicationScreen(),
                      AccountsScreen(),
                      GrievancesRedressalScreen(),
                      SettingsScreen(),
                      // AppointmentScreen(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      future: Future.value(true),
    );
  }
}
