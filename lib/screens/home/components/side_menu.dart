import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_admin_dashboard/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final PageController controller;


  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        // it enables scrolling
        child: Column(
          children: [
            DrawerHeader(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: defaultPadding * 3,
                ),
                Image.asset(
                  "assets/images/logo.png",
                  scale: 24,
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                Text(
                  "Udbhaban SalesLens",
                  style: TextStyle(
                    fontSize: 9.sp,
                  ),
                )
              ],
            )),
            DrawerListTile(
              title: "Dashboard",
              svgSrc: "assets/icons/menu_dashbord.svg",
              press: () {

                setState(() {
                  widget.controller.jumpToPage(0);
                });
              },
              isSelected: widget.controller.page?.toInt() == 0,
            ),
            DrawerListTile(
              title: "Leads",
              svgSrc: "assets/icons/filter.svg",
              press: () {
                setState(() {
                  widget.controller.jumpToPage(1);
                });
              },
              isSelected: widget.controller.page?.toInt() == 1,
            ),
            DrawerListTile(
              title: "Customers",
              svgSrc: "assets/icons/customer_service.svg",
              press: () {
                setState(() {
                  widget.controller.jumpToPage(2);

                });
              },
              isSelected: widget.controller.page?.toInt() == 2,
            ),
            DrawerListTile(
              title: "Analytics",

              svgSrc: "assets/icons/analytics.svg",
              press: () {
                setState(() {
                  widget.controller.jumpToPage(3);
                });
              },
              isSelected: widget.controller.page?.toInt() == 3,
            ),
            DrawerListTile(
              title: "Communication",
              svgSrc: "assets/icons/messaging.svg",
              press: () {
               setState(() {
                 widget.controller.jumpToPage(4);
               });
              },
              isSelected: widget.controller.page?.toInt() == 4,
            ),
            DrawerListTile(
              title: "Account",
              svgSrc: "assets/icons/menu_profile.svg",
              press: () {
                setState(() {
                  widget.controller.jumpToPage(5);
                });
              },
              isSelected: widget.controller.page?.toInt() == 5,
            ),
            DrawerListTile(
              title: "Grievance Redressal",
              svgSrc: "assets/icons/complaint.svg",
              press: () {
                setState(() {
                  widget.controller.jumpToPage(6);
                });
              },
              isSelected: widget.controller.page?.toInt() == 6,
            ),
            DrawerListTile(
              title: "Settings",
              svgSrc: "assets/icons/menu_setting.svg",
              press: () {
                setState(() {
                  widget.controller.jumpToPage(7);
                });
              },
              isSelected: widget.controller.page?.toInt() == 7,
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
    required this.isSelected,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: isSelected ? Colors.white : Colors.white12,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: isSelected ? Colors.white : Colors.white12, fontSize: 8.sp),
      ),
    );
  }
}
