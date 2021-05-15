import 'package:flutter/material.dart';
import 'package:mobile_cataloge/pages/cart_page.dart';
import 'package:mobile_cataloge/pages/home_page.dart';
import 'package:mobile_cataloge/pages/login_page.dart';
import 'package:mobile_cataloge/utils/routes.dart';
import 'package:mobile_cataloge/widgets/themes.dart';

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
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
