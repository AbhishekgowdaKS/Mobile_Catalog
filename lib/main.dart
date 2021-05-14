import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_cataloge/pages/home_page.dart';
import 'package:mobile_cataloge/pages/login_page.dart';
import 'package:mobile_cataloge/utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Material Catalog",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: GoogleFonts.lato().fontFamily,
      ),
      themeMode: ThemeMode.light,
      darkTheme: ThemeData(brightness: Brightness.dark),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
      },
    );
  }
}
