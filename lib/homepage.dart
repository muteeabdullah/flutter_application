import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application/widgets/mydrawer.dart';

class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      drawer: mydrawer(),
      appBar: AppBar(
        title: Text(
          'Home Page',
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Container(
          child: Text('this is homepage',
          textScaleFactor: 2,
          ),
        ),
      ),
      
    );

  }
}
