import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_admin_dashboard/core/constants/color_constants.dart';
import 'package:smart_admin_dashboard/core/utils/colorful_tag.dart';
import 'package:smart_admin_dashboard/models/recent_user_model.dart';
import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/material.dart';

class RecentUsers extends StatelessWidget {
  const RecentUsers({
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
            "Leads",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 9.sp,
                ),
          ),
          SingleChildScrollView(
            //scrollDirection: Axis.horizontal,
            child: SizedBox(
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
                    label: Text("Company"),
                  ),
                  DataColumn(
                    label: Text("Name"),
                  ),
                  DataColumn(
                    label: Text("Date"),
                  ),
                  DataColumn(
                    label: Text("Source"),
                  ),
                  DataColumn(
                    label: Text("Status"),
                  ),
                  DataColumn(
                    label: Text("Budget"),
                  ),
                  DataColumn(
                    label: Text("Action"),
                  ),
                ],
                rows: [
                  for (var lead in recentLead) recentUserDataRow(lead, context)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentUserDataRow(Lead userInfo, BuildContext context) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            TextAvatar(
              size: 35,
              backgroundColor: Colors.white,
              textColor: Colors.white,
              fontSize: 8.sp,
              upperCase: true,
              numberLetters: 1,
              shape: Shape.Rectangle,
              text: userInfo.company!,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(
                userInfo.company!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      DataCell(Container(
          // padding: EdgeInsets.all(5),
          // decoration: BoxDecoration(
          //   color: getRoleColor(userInfo.name).withOpacity(.2),
          //   border: Border.all(color: getRoleColor(userInfo.name)),
          //   borderRadius: BorderRadius.all(Radius.circular(5.0) //
          //       ),
          // ),
          child: Text(userInfo.name!))),
      DataCell(Text(userInfo.date!)),
      DataCell(Text(userInfo.source!)),
      DataCell(Text(userInfo.status!)),
      DataCell(Text(userInfo.budget!)),
      DataCell(
        Row(
          children: [
            TextButton(
              child: Text(
                'View',
                style: TextStyle(
                  color: greenColor,
                  fontSize: 8.sp,
                ),
              ),
              onPressed: () {},
            ),
            // SizedBox(
            //   width: 6,
            // ),
            // TextButton(
            //   child: Text("Delete", style: TextStyle(color: Colors.redAccent)),
            //   onPressed: () {
            //     showDialog(
            //         context: context,
            //         builder: (_) {
            //           return AlertDialog(
            //               title: Center(
            //                 child: Column(
            //                   children: [
            //                     Icon(Icons.warning_outlined,
            //                         size: 36, color: Colors.red),
            //                     SizedBox(height: 20),
            //                     Text("Confirm Deletion"),
            //                   ],
            //                 ),
            //               ),
            //               content: Container(
            //                 color: secondaryColor,
            //                 height: 70,
            //                 child: Column(
            //                   children: [
            //                     Text(
            //                         "Are you sure want to delete '${userInfo.name}'?"),
            //                     SizedBox(
            //                       height: 16,
            //                     ),
            //                     Row(
            //                       mainAxisAlignment: MainAxisAlignment.center,
            //                       children: [
            //                         ElevatedButton.icon(
            //                             icon: Icon(
            //                               Icons.close,
            //                               size: 14,
            //                             ),
            //                             style: ElevatedButton.styleFrom(
            //                                 backgroundColor: Colors.grey),
            //                             onPressed: () {
            //                               Navigator.of(context).pop();
            //                             },
            //                             label: Text("Cancel")),
            //                         SizedBox(
            //                           width: 20,
            //                         ),
            //                         ElevatedButton.icon(
            //                             icon: Icon(
            //                               Icons.delete,
            //                               size: 14,
            //                             ),
            //                             style: ElevatedButton.styleFrom(
            //                                 backgroundColor: Colors.red),
            //                             onPressed: () {},
            //                             label: Text("Delete"))
            //                       ],
            //                     )
            //                   ],
            //                 ),
            //               ));
            //         });
            //   },
            //   // Delete
            // ),
          ],
        ),
      ),
    ],
  );
}
