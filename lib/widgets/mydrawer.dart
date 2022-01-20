
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class mydrawer extends StatelessWidget {
  const mydrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final imageurl = "https://scontent.fisb15-1.fna.fbcdn.net/v/t1.6435-9/89152012_1077191915972644_7855142567568998400_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeEr7jb31zFCu6EWNR9hiGJnemjunTcUey56aO6dNxR7LiNRlXBmdN2ewFAI17tQNpGIDMWIou8eRf-7k37mF3KC&_nc_ohc=3NBKuMj-YAsAX8LxmFb&_nc_ht=scontent.fisb15-1.fna&oh=00_AT-VU6a3LzjF1wKXrZMS4tdmT-Bsg2iAcqEd7bhO1KXqBQ&oe=620DBFD8";
    return Drawer(
        child: Container(
           color: Colors.deepPurple,
          child: ListView(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                child: 
                UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  
                  accountEmail: const Text('samikaka0987@gmail.com'),
                  accountName: Text('mutee abdullah'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imageurl),
                  ),
                  ),
              ),
              const ListTile(
                leading: Icon(CupertinoIcons.home,
                color: Colors.white,),
                title: Text('Home',
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white
                ),
                ),
              ),
              const ListTile(
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