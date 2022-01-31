import 'package:flutter/material.dart';
import 'package:flutter_application/pages/cart.dart';
import 'package:flutter_application/pages/detailspage.dart';
import 'package:flutter_application/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/src/extensions/context_ext.dart';
import 'pages/login.dart';
import 'pages/homepage.dart';
import 'widgets/themes.dart';

void main() {
  runApp(myapp());
}

// ignore: camel_case_types
class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepPurple,
        canvasColor: mythemes.creamcolor,
        cardColor: Colors.white,
        primaryColor: mythemes.myblue,
        focusColor: mythemes.myblue,

        // ignore: deprecated_member_use
        buttonColor: mythemes.myblue,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme:  const AppBarTheme(
          color: Colors.white,
          elevation: 0.1,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black)

          
          
         
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
        canvasColor: Colors.black,
        cardColor: mythemes.myblue,
        primaryColor: Colors.blue,
        focusColor: Colors.white,
        // ignore: deprecated_member_use
        buttonColor: Colors.white,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: const AppBarTheme(
          color: Colors.black,
          elevation: 0.1,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white)
        
         
      ),),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const homepage(),
        Myroutes.HomeRoute: (context) => const homepage(),
        Myroutes.LoginRoute: (context) => login_page(),
        Myroutes.cartroute: (context) => const CartPage(),
      },
    );
  }
}
