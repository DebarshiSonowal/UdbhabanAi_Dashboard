import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_admin_dashboard/screens/customers/Widgets/customer_list.dart';

import '../../core/constants/color_constants.dart';
import '../../responsive.dart';
import '../leads/components/leads_more_options.dart';
import 'Widgets/customer_history.dart';
// import '../leads/components/customer_list.dart';

class CustomersScreen extends StatefulWidget {
  // const CustomersScreen({super.key});

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 2.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: defaultPadding),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        // ClientList(),
                        SizedBox(height: defaultPadding),
                        CustomerList(),
                        SizedBox(height: defaultPadding),
                        if (Responsive.isMobile(context))
                          SizedBox(height: defaultPadding),
                        if (Responsive.isMobile(context)) CustomerHistory(),
                      ],
                    ),
                  ),
                  if (!Responsive.isMobile(context))
                    SizedBox(width: defaultPadding),
                  // On Mobile means if the screen is less than 850 we dont want to show it
                  if (!Responsive.isMobile(context))
                    Expanded(
                      flex: 3,
                      child: CustomerHistory(),
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
