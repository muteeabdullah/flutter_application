import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class mydrawer extends StatelessWidget {
  const mydrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final imageurl = "https://st.depositphotos.com/1342206/1463/i/600/depositphotos_14634185-stock-photo-hackers-concept-digital-illustration.jpg";
    return Drawer(
        child: Container(
           color: Colors.blue,
          child: ListView(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                child: 
                UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  
                  accountEmail: Text('samikaka0987@gmail.com'),
                  accountName: Text('mutee abdullah'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imageurl),
                  ),
                  ),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.home,
                color: Colors.white,),
                title: Text('Home',
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white
                ),
                ),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.profile_circled,
                color: Colors.white,),
                title: Text('Profile',
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white
                ),
                ),
              ),
              ListTile(
                leading: Icon(CupertinoIcons.mail,
                color: Colors.white,),
                title: Text('Email me',
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white
                ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}