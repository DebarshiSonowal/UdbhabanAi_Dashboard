import 'package:flutter/material.dart';
import 'package:smart_admin_dashboard/screens/leads/components/leads_list.dart';

import '../../core/constants/color_constants.dart';
import '../../responsive.dart';
import '../dashboard/components/recent_users copy.dart';
import '../dashboard/components/user_details_widget.dart';
import 'components/client_list.dart';
import 'components/leads_more_options.dart';

class LeadsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(defaultPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header(),

              // MiniInformation(),
              SizedBox(height: defaultPadding),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        ClientList(),
                        SizedBox(height: defaultPadding),
                        LeadsList(),
                        SizedBox(height: defaultPadding),
                        if (Responsive.isMobile(context))
                          SizedBox(height: defaultPadding),
                        if (Responsive.isMobile(context)) LeadDetailsWidget(),
                      ],
                    ),
                  ),
                  if (!Responsive.isMobile(context))
                    SizedBox(width: defaultPadding),
                  // On Mobile means if the screen is less than 850 we dont want to show it
                  if (!Responsive.isMobile(context))
                    Expanded(
                      flex: 2,
                      child: LeadDetailsWidget(),
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
