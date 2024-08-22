import 'dart:math';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_admin_dashboard/core/constants/color_constants.dart';
import 'package:smart_admin_dashboard/core/utils/colorful_tag.dart';
import 'package:smart_admin_dashboard/models/recent_user_model.dart';
import 'package:flutter/material.dart';

class RecentDiscussions extends StatelessWidget {
  const RecentDiscussions({
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
          Text(
            "Suggested Leads",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: 9.sp,
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              horizontalMargin: 0,
              dataTextStyle:
              Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 7.sp,
              ),
              headingTextStyle:
              Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 8.sp,
              ),
              columnSpacing: defaultPadding,
              columns: [
                DataColumn(
                  label: Text("Name"),
                ),
                DataColumn(
                  label: Text("Probability"),
                ),
                DataColumn(
                  label: Text("Expected Revenue"),
                ),
              ],
              rows: suggestedLead.map((lead) => recentUserDataRow(lead)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentUserDataRow(Lead userInfo) {
  return DataRow(
    cells: [
      DataCell(Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: getRoleColor(userInfo.company).withOpacity(.2),
            border: Border.all(color: getRoleColor(userInfo.company)),
            borderRadius: BorderRadius.all(Radius.circular(5.0) //
                ),
          ),
          child: Text(userInfo.company!))),
      DataCell(Text("${Random.secure().nextInt(100)}%")),
      DataCell(Text("\$${userInfo.budget!}")),
    ],
  );
}
