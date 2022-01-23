import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/catalog.dart';
import 'package:flutter_application/widgets/itemwidget.dart';
import 'package:flutter_application/widgets/mydrawer.dart';
import 'package:flutter_application/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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
      backgroundColor: mythemes.creamcolor,
      body: SafeArea(
        child: Container(
          padding: Vx.m16,
          child: catalogheader(),
        ),
      ),
    );
  }
}

class catalogheader extends StatelessWidget {
  const catalogheader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.bold.color(mythemes.myblue).xl5.make(),
        "Trending products".text.color(mythemes.myblue).xl2.make(),
        if (catalogmodel.items != null && catalogmodel.items.isNotEmpty)
          cataloglist().expand()
        else
          Center(
            
            child: CircularProgressIndicator().py64(),
          )
      ],
    );
  }
}

class cataloglist extends StatelessWidget {
  const cataloglist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: dead_code, dead_code
    return ListView.builder(
        shrinkWrap: true,
        itemCount: catalogmodel.items.length,
        itemBuilder: (context, index) {
          final catalog = catalogmodel.items[index];
          return catalogitem(
            catalog: catalog,
          );
        });
  }
}

// ignore: camel_case_types
class catalogitem extends StatelessWidget {
  final item catalog;

  const catalogitem({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [

        catalogimage(image: catalog.image),
       Expanded(   
         child: 
       Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           catalog.name.text.bold.color(mythemes.myblue).make().py8(),
           catalog.description.text.make(),
           ButtonBar(
             children: [
               "\$${catalog.price}".text.color(mythemes.myblue).xl.bold.make(),
               ElevatedButton(onPressed: (){},
               style: ButtonStyle(
                 backgroundColor: 
               MaterialStateProperty.all(mythemes.myblue)
               ), 
               child:
                "Buy".text.make().py2()
               )
             ],
           )
         ],
       )
       )
      ],
    )).white.rounded.square(150).make().py12();
  }
}

class catalogimage extends StatelessWidget {
  final String image;

  const catalogimage({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   
    
    return Image.network(image)
        .box
        .color(mythemes.creamcolor)
        .p4
        .rounded
        .make()
        .p8()
        .w40(context);
  }
}


class catalogtitle extends StatelessWidget {
 final String name;

  const catalogtitle({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(name);
  }
}