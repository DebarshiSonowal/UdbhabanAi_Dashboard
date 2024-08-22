import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:smart_admin_dashboard/core/constants/color_constants.dart';
import 'package:smart_admin_dashboard/core/init/provider_list.dart';
import 'package:smart_admin_dashboard/screens/home/home_screen.dart';
import 'package:smart_admin_dashboard/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smart_admin_dashboard/storage/shared_prf.dart';

void main() async {
  await Storage.instance.initializeStorage();
  runApp(MyApp());
}

Widget build(BuildContext context) {
  return MultiProvider(
      providers: [...ApplicationProvider.instance.dependItems],
      child: Builder(
        builder: (context) {
          return MyApp();
        },
      ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Udbhaban SalesLens - Admin Panel v0.1 ',
        theme: ThemeData.dark().copyWith(
          appBarTheme: AppBarTheme(backgroundColor: bgColor, elevation: 0),
          scaffoldBackgroundColor: bgColor,
          primaryColor: greenColor,
          dialogBackgroundColor: secondaryColor,
          textTheme: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white),
          canvasColor: secondaryColor,
        ),
        home: Storage.instance.isLoggedIn
            ? Login(title: "Welcome to the Udbhaban SalesLens")
            : HomeScreen(),
      );
    });
  }
}
