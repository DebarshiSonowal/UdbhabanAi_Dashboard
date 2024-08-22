import 'package:faker_dart/faker_dart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_admin_dashboard/screens/customers/Widgets/timeline_card.dart';
import 'package:timelines_plus/timelines_plus.dart';

import '../../../core/constants/color_constants.dart';

class CustomerHistory extends StatelessWidget {
  // const CustomerHistory({super.key});
  final list = [
    'Phone Call Made','Lead Converted','Demo Done','Negotiation',"Quotation Sent","Payment Made","Installation"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35.w,
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("${Faker.instance.company.companyName()}"),
            SizedBox(
              height: 5.h,
            ),
            Timeline.tileBuilder(
              shrinkWrap: true,
              builder: TimelineTileBuilder.fromStyle(
                contentsAlign: ContentsAlign.alternating,
                contentsBuilder: (context, index) => TimelineCard(
                  index: index,
                  list:list,
                ),
                itemCount: list.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
