import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first/utils/routes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final imageurl = "https://miro.medium.com/max/1200/1*mk1-6aYaf_Bes1E3Imhc0A.jpeg";

    return Drawer(
      child: Container(
        //color: Colors.yellow.shade700,
        child: ListView(
          children: [
            DrawerHeader(
              padding:EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountName: const Text("Soumyajit Das"),
              accountEmail: const Text("soumyajitdas2101999@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imageurl),
              ),
            )
            ),
            const SizedBox(height: 50,),
            const ListTile(
            
              leading: Icon(CupertinoIcons.home),
              title: Text("Home",textScaleFactor: 1.2,),
            ),
            const ListTile(
              leading: Icon(CupertinoIcons.profile_circled),
              title: Text("Profile",textScaleFactor: 1.2,),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.restart),
              title: const Text("Restart",textScaleFactor: 1.2,),
            )
          ],
        ),
      ),
    );
  }
}