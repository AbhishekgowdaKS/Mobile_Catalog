import 'package:flutter/material.dart';
import 'package:mobile_cataloge/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mobile Catalog"),),
      body: Center(
        child: Container(
          child: Text("Welcome to Mobile Catalog"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
