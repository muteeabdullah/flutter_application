import 'package:flutter/material.dart';
import 'package:flutter_application/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';
import 'homepage.dart';

void main() {
  runApp(myapp());
}

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.lato().fontFamily,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0.1,
          iconTheme: const IconThemeData(color: Colors.black),
          // ignore: deprecated_member_use
          textTheme: Theme.of(context).textTheme,
        ),
      ),
      darkTheme: ThemeData(primarySwatch: Colors.green),
            debugShowCheckedModeBanner: false,

      routes: {
        
        "/": (context) => homepage(),
        Myroutes.HomeRoute: (context) => const homepage(),
        Myroutes.LoginRoute: (context) => login_page(),
      },
    );
  }
}
