import 'package:flutter/material.dart';
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
      theme: ThemeData(primarySwatch: Colors.purple,
      fontFamily: GoogleFonts.lato().fontFamily,
     // primaryTextTheme: GoogleFonts.latoTextTheme(),
      ),
      darkTheme: ThemeData(primarySwatch: Colors.green),
      routes: {
        "/": (context) => login_page(),
        
      },
    );
  }
}