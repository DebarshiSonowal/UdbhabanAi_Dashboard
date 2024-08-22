import 'dart:math';

import 'package:faker_dart/faker_dart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// import 'package:smart_admin_dashboard/models/Client.dart';

import '../../../core/constants/color_constants.dart';
// import '../../../models/Client.dart';

class CustomerList extends StatelessWidget {
  // const ClientList({super.key});

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
            "Customers",
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
                    label: Text("Last"),
                  ),
                  DataColumn(
                    label: Text("Pending"),
                  ),
                  DataColumn(
                    label: Text("Operation"),
                  ),
                ],
                rows: clientList
                    .map((client) => recentUserDataRow(client, context))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentUserDataRow(Client userInfo, BuildContext context) {
  return DataRow(
    cells: [
      DataCell(
        Container(
          // padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(
            userInfo.company!,
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
      DataCell(Text(DateFormat("dd/MM/yyyy").format(DateTime.now()))),
      DataCell(Text("₹${Random.secure().nextInt(100000)}")),
      DataCell(
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.green.withOpacity(0.5),
          ),
          icon: Icon(
            Icons.history,
            size: 10.sp,
          ),
          onPressed: () {},
          //View
          label: Text(
            "View History",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontSize: 7.sp,
                ),
          ),
        ),
      ),
    ],
  );
}

class Client {
  int? clientId, leadId;
  String? name, email, phone, company, industry;

  Client(this.clientId, this.leadId, this.name, this.email, this.phone,
      this.company, this.industry);
}

List<Client> clientList = [
  Client(
    Random().nextInt(10000),
    Random().nextInt(10000),
    Faker.instance.name.fullName(),
    "qwerty@gmail.com",
    "9678676752",
    Faker.instance.company.companyName(),
    "",
  ),
  Client(
    Random().nextInt(10000),
    Random().nextInt(10000),
    Faker.instance.name.fullName(),
    "qwerty@gmail.com",
    "9678676752",
    Faker.instance.company.companyName(),
    "",
  ),
  Client(
    Random().nextInt(10000),
    Random().nextInt(10000),
    Faker.instance.name.fullName(),
    "qwerty@gmail.com",
    "9678676752",
    Faker.instance.company.companyName(),
    "",
  ),
  Client(
    Random().nextInt(10000),
    Random().nextInt(10000),
    Faker.instance.name.fullName(),
    "qwerty@gmail.com",
    "9678676752",
    Faker.instance.company.companyName(),
    "",
  ),
];