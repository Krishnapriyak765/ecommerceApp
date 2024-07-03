import 'package:ecommerce_app/constants.dart';
import 'package:ecommerce_app/homePage.dart';
import 'package:ecommerce_app/login.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:shared_preferences/shared_preferences.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
            children:  [ 
             SizedBox(
              height: 50,
             ),
             Align(
              alignment: Alignment.center,
              child: Text("E-COMMERCE",
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),),
             ),
             SizedBox(height: 20,),
             Divider(),
             SizedBox(height: 10,),
             ListTile(
              leading: Icon(Icons.home),
              title: Text("Home",style: TextStyle(fontSize: 15),),
              trailing: Icon(Icons.arrow_forward_ios_rounded,size: 15,),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
              },
             ),
             ListTile(
              leading: badges.Badge(
               badgeContent: Text('3'),
      child: Icon(Icons.settings),

              ),
             ),
             ListTile(
              leading: Icon(Icons.book_online),
              title: Text("Order Details",style: TextStyle(fontSize: 15),),
              trailing: Icon(Icons.arrow_forward_ios_rounded,size: 15,),
              onTap: () {
               // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
              },
             ),
             Divider(),
             ListTile(
              leading: Icon(Icons.power_settings_new_rounded),
              title: Text("Logout",style: TextStyle(fontSize: 15),),
              trailing: Icon(Icons.arrow_forward_ios_rounded,size: 15,),
              onTap: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool("isLoggedIn", false);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
              },
             ),
            ],    
                  )),
    );
  }
}