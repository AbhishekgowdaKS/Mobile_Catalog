import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Image.asset("assets/images/login_image.png", fit: BoxFit.cover,),
          SizedBox(height: 20,),
          Text("Welcome", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: "Username", hintText: "Enter username"),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Password", hintText: "Enter password"),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: (){print("Logging in");},
                  child: Text("Login"),
                  style: TextButton.styleFrom(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
