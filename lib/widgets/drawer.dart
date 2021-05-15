import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imgUrl = "https://img-premium.flaticon.com/png/512/3011/3011270.png?token=exp=1621069066~hmac=e07d4314905e919c9166ff7255e82d42";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text("Username"),
                  accountEmail: Text("user_email@example.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imgUrl),
                  ),
                )
            ),
            ListTile(
              leading: Icon(CupertinoIcons.home, color: Colors.white,),
              title: Text("Home", textScaleFactor: 1.2, style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.profile_circled, color: Colors.white,),
              title: Text("Profile", textScaleFactor: 1.2, style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.mail, color: Colors.white,),
              title: Text("Mails", textScaleFactor: 1.2, style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
