import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_admin_dashboard/core/constants/color_constants.dart';
import 'package:smart_admin_dashboard/screens/communication/widgets/chat_ui.dart';

class CommunicationScreen extends StatefulWidget {
  // const CommunicationScreen({super.key});

  @override
  State<CommunicationScreen> createState() => _CommunicationScreenState();
}

class _CommunicationScreenState extends State<CommunicationScreen>
    with SingleTickerProviderStateMixin {
  // Sample communication data (replace with your actual data)
  final List<Map<String, dynamic>> _communications = [
    {
      'title': 'Michael B',
      'content': 'I placed an order, but will it take longer?',
      'unread': true
    },
    {
      'title': 'Janet',
      'content': 'I want to make changes to my sauce, I hope it ',
      'unread': false
    },
    {
      'title': 'Putri Adel',
      'content': 'I want to make changes to my sauce, I ho..',
      'unread': true
    },
    // Add more communication data...
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 2.w,
          vertical: 1.h,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: DefaultTabController(
                  length: 3, // Match the number of tabs
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5.h,
                        width: double.infinity,
                        child: TabBar(
                          labelStyle:
                              TextStyle(fontSize: 9.sp, color: Colors.white),
                          indicatorColor: Colors.white,
                          unselectedLabelColor: Colors.white70,
                          unselectedLabelStyle:
                              TextStyle(fontSize: 8.sp, color: Colors.white70),
                          tabs: [
                            Tab(text: "All"),
                            Tab(text: "Unread"),
                            Tab(text: "Complaint"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            // Tab 1: All Communications
                            Expanded(
                              child: ListView.builder(
                                itemCount: _communications.length,
                                itemBuilder: (context, index) {
                                  final communication = _communications[index];
                                  return CommunicationItem(
                                    title: communication['title'],
                                    content: communication['content'],
                                    unread: communication['unread'],
                                  );
                                },
                              ),
                            ),
                            // Tab 2: Unread Communications
                            Expanded(
                              child: ListView.builder(
                                itemCount: _communications
                                    .where((comm) => comm['unread'])
                                    .toList()
                                    .length,
                                itemBuilder: (context, index) {
                                  final communication = _communications
                                      .where((comm) => comm['unread'])
                                      .toList()[index];
                                  return CommunicationItem(
                                    title: communication['title'],
                                    content: communication['content'],
                                    unread: communication['unread'],
                                  );
                                },
                              ),
                            ),
                            // Tab 3: Complaint Communications
                            Expanded(
                              child: ListView.builder(
                                itemCount: _communications
                                    .where((comm) => comm['title']
                                        .toLowerCase()
                                        .contains('complaint'))
                                    .toList()
                                    .length,
                                itemBuilder: (context, index) {
                                  final communication = _communications
                                      .where((comm) => comm['title']
                                          .toLowerCase()
                                          .contains('complaint'))
                                      .toList()[index];
                                  return CommunicationItem(
                                    title: communication['title'],
                                    content: communication['content'],
                                    unread: communication['unread'],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.3.w,
                  ),
                  child: Column(
                    // ma
                    children: [
                      Container(
                        height: 7.h,
                        width: double.infinity,
                        color: secondaryColor,
                        padding: EdgeInsets.symmetric(
                          horizontal: 2.w,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              // height: 5.w,
                              width: 6.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100.0),
                                child: Image.asset(
                                  "assets/images/mockup-3.png",
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 1.h,
                              ),
                              width: 10.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Michale B",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 9.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 0.2.w,
                                  ),
                                  Text(
                                    "Customer",
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 6.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.more_horiz,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 91.h,
                        width: double.infinity,
                        child: ChatUi(),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.3.w,
                  ),
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_bag,
                          ),
                          SizedBox(
                            width: 0.5.w,
                          ),
                          Text(
                            "Detail Order",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 11.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Order #1",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.white54,
                              fontSize: 8.sp,
                            ),
                          ),
                          Text(
                            "${DateFormat("MMM dd, yyyy, HH:mm a").format(DateTime.now())}",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                              fontSize: 8.sp,
                            ),
                          ),
                        ],
                      ),
                      ExpansionTile(
                        tilePadding: EdgeInsets.symmetric(
                          horizontal: 0.1.w,
                        ),
                        title: Text(
                          "Product",
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Colors.white,
                                    fontSize: 9.sp,
                                  ),
                        ),
                        children: [
                          ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: SizedBox(
                                  height: 5.w,
                                  width: 3.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: Image.asset(
                                      "assets/images/mockup-3.png",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                title: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 8.w,
                                      child: Text(
                                        "Michale B Jordan",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 7.sp,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 0.4.w,
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                      child: Text(
                                        "Variant: Space Grey",
                                        style: TextStyle(
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 6.sp,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 0.4.w,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 7.w,
                                          child: Text(
                                            "Quantity: 1",
                                            style: TextStyle(
                                              // fontWeight: FontWeight.bold,
                                              fontSize: 6.sp,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 7.w,
                                          child: Text(
                                            "\$23.00",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 7.sp,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider();
                            },
                            itemCount: 3,
                          ),
                        ],
                      ),
                      ExpansionTile(
                        tilePadding: EdgeInsets.symmetric(
                          horizontal: 0.1.w,
                        ),
                        title: Text(
                          "Address",
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Colors.white,
                                    fontSize: 9.sp,
                                  ),
                        ),
                        children: [
                          SizedBox(
                            width: 15.w,
                            child: Text(
                              "2464 Royal Ln. Mesa, New Jersey 45463",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 7.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom widget to display each communication item
class CommunicationItem extends StatelessWidget {
  final String title;
  final String content;
  final bool unread;

  const CommunicationItem({
    Key? key,
    required this.title,
    required this.content,
    required this.unread,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: SizedBox(
          height: 5.w,
          width: 3.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100.0),
            child: Image.asset(
              "assets/images/profile_pic.png",
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 9.sp,
          ),
        ),
        subtitle: Text(
          content,
          style: TextStyle(
            fontWeight: unread ? FontWeight.bold : FontWeight.normal,
            fontSize: 6.sp,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0.4.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: primaryColor,
          ),
          child: Text(
            "4",
            style: TextStyle(
              fontWeight: unread ? FontWeight.bold : FontWeight.normal,
              fontSize: 7.sp,
              color: Colors.white,
            ),
          ),
        ),
        onTap: () {
          // Handle navigation to communication details
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => CommunicationDetailsScreen(
          //       communication: this,
          //     ),
          //   ),
          // );
        },
      ),
    );
  }
}
