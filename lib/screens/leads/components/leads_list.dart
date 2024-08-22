import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_admin_dashboard/core/constants/color_constants.dart';

import 'package:smart_admin_dashboard/core/utils/colorful_tag.dart';
import 'package:smart_admin_dashboard/models/recent_user_model.dart';
import 'package:colorize_text_avatar/colorize_text_avatar.dart';
import 'package:flutter/material.dart';

class LeadsList extends StatelessWidget {
  const LeadsList({
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
            "Opportunities",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 9.sp,
                ),
          ),
          SingleChildScrollView(
            //scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: double.infinity,
              child: DataTable(
                headingTextStyle:
                    Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 8.5.sp,
                        ),
                dataTextStyle:
                    Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 7.5.sp,
                        ),
                horizontalMargin: 0,
                columnSpacing: defaultPadding,
                columns: [
                  DataColumn(
                    label: Text("Company"),
                  ),
                  DataColumn(
                    label: Text("Name"),
                  ),
                  DataColumn(
                    label: Text("E-mail"),
                  ),
                  DataColumn(
                    label: Text("Status"),
                  ),
                  DataColumn(
                    label: Text("Payment"),
                  ),
                  DataColumn(
                    label: Text("Operation"),
                  ),
                ],
                rows: recentLead
                    .map((lead) => recentUserDataRow(lead, context))
                    .toList(),
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
        Container(
          // padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(
            userInfo.name!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      DataCell(Container(
          // padding: EdgeInsets.all(2),
          // decoration: BoxDecoration(
          //   color: getRoleColor(userInfo.company).withOpacity(.2),
          //   border: Border.all(color: getRoleColor(userInfo.company)),
          //   borderRadius: BorderRadius.all(Radius.circular(5.0) //
          //   ),
          // ),
          child: Text(userInfo.name!))),
      DataCell(Text(userInfo.email!)),
      DataCell(
        Container(
          decoration: BoxDecoration(
            color: Colors.green.shade200,
            border: Border.all(
              color: Colors.green,
              width: 0.2.w,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          margin: EdgeInsets.symmetric(
            horizontal: 1.5.w,
            vertical: 0.2.w,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 1.w,
            vertical: 0.5.w,
          ),
          child: Center(
            child: Text(
              userInfo.status!,
              style: TextStyle(
                color: Colors.black
              ),
            ),
          ),
        ),
      ),
      DataCell(Text(userInfo.budget!)),
      DataCell(
        Row(
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.blue.withOpacity(0.5),
              ),
              icon: Icon(
                Icons.edit,
                size: 10.sp,
              ),
              onPressed: () {},
              // Edit
              label: Text(
                "Edit",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 7.sp,
                    ),
              ),
            ),
            SizedBox(
              width: 6,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.green.withOpacity(0.5),
              ),
              icon: Icon(
                Icons.visibility,
                size: 10.sp,
              ),
              onPressed: () {},
              //View
              label: Text(
                "View",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 7.sp,
                    ),
              ),
            ),
            // SizedBox(
            //   width: 6,
            // ),
            // ElevatedButton.icon(
            //   style: ElevatedButton.styleFrom(
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     backgroundColor: Colors.red.withOpacity(0.5),
            //   ),
            //   icon: Icon(
            //     Icons.delete,
            //     size: 10.sp,
            //   ),
            //   onPressed: () {
            //     showDialog(
            //         context: context,
            //         builder: (_) {
            //           return AlertDialog(
            //               title: Center(
            //                 child: Text("Confirm Deletion"),
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
            //   label: Text(
            //     "Delete",
            //     style: Theme.of(context).textTheme.titleMedium?.copyWith(
            //       fontSize: 7.sp,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    ],
  );
}
