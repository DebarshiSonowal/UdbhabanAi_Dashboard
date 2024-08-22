import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_admin_dashboard/core/constants/color_constants.dart';
import 'package:smart_admin_dashboard/screens/dashboard/components/calendart_widget.dart';
import 'package:smart_admin_dashboard/screens/dashboard/components/charts.dart';
import 'package:smart_admin_dashboard/screens/dashboard/components/user_details_mini_card.dart';
import 'package:flutter/material.dart';

class UserDetailsWidget extends StatelessWidget {
  const UserDetailsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CalendarWidget(),
          Text(
            "Lead Source",
            style: TextStyle(
              fontSize: 9.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height:2.h),
          Chart(),
          UserDetailsMiniCard(
            color: Color(0xff0293ee),
            title: "Call",
            amountOfFiles: "%28.3",
            numberOfIncrease: 1328,
          ),
          UserDetailsMiniCard(
            color: Color(0xfff8b250),
            title: "Email",
            amountOfFiles: "%16.7",
            numberOfIncrease: 1328,
          ),
          UserDetailsMiniCard(
            color: Color(0xff845bef),
            title: "In Person",
            amountOfFiles: "%22.4",
            numberOfIncrease: 1328,
          ),
          UserDetailsMiniCard(
            color: Color(0xff13d38e),
            title: "Website",
            amountOfFiles: "%2.3",
            numberOfIncrease: 140,
          ),
        ],
      ),
    );
  }
}
