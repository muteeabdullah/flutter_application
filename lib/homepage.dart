import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application/catalog.dart';
import 'package:flutter_application/widgets/itemwidget.dart';
import 'package:flutter_application/widgets/mydrawer.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    final dummylist = List.generate(10, (index)=>catalogmodel.items[0]);
    return Scaffold(
      drawer: mydrawer(),
      appBar: AppBar(
        title: Text(
          'Catalog App',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummylist.length,
          itemBuilder: (BuildContext context, int index) {
            return itemWidget(
              Item: dummylist[index],);
          },
        ),
      ),
    );
  }
}
