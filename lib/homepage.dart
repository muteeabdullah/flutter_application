import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/catalog.dart';
import 'package:flutter_application/widgets/itemwidget.dart';
import 'package:flutter_application/widgets/mydrawer.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  get itemBuilder => null;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/products.json");
    var decodedData = jsonDecode(catalogJson);
    var productsdata = decodedData["products"];
    // ignore: non_constant_identifier_names
    catalogmodel.items = List.from(productsdata)
        .map<item>((Item) => item.fromMap(Item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
          child: (catalogmodel.items != null && catalogmodel.items.isNotEmpty)
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    final item = catalogmodel.items[index];
                    return GridTile(child:
                     Image.network(item.image,),
                     header: Text(item.name,
                     style:
                      TextStyle(color: Colors.black38,
                     fontWeight: FontWeight.bold,
                     
                     ),
                     
                     ),
                    );
                  },
                  itemCount: catalogmodel.items.length,
                )
              // ListView.builder(
              //         itemCount: catalogmodel.items.length,
              //         itemBuilder: (BuildContext context, int index) {
              //           return itemWidget(
              //             Item: catalogmodel.items[index],
              //           );
              //         },
              //       )
              : Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }
}
