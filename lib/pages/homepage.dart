import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/catalog.dart';
import 'package:flutter_application/utils/routes.dart';
import 'package:flutter_application/widgets/itemwidget.dart';
import 'package:flutter_application/widgets/mydrawer.dart';
import 'package:flutter_application/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'detailspage.dart';

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
          child: catalogheader().py16(),
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
        if (catalogmodel.items.isNotEmpty)
          const cataloglist().expand()
        else
          const CircularProgressIndicator().centered().expand(),
      ],
    );
  }
}

class cataloglist extends StatelessWidget {
  const cataloglist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: catalogmodel.items.length,
        itemBuilder: (context, index) {
          final catalog = catalogmodel.items[index];
          return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Detailspage(catalog: catalog))),
            child: catalogitem(
              catalog: catalog,
            ),
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
        Hero(
            tag: Key(catalog.id.toString()),
            child: catalogimage(image: catalog.image)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.bold.color(mythemes.myblue).make().py8(),
            catalog.description.text.make(),
            catalogprice(catalog: catalog)
          ],
        ))
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

class catalogprice extends StatelessWidget {
  final item catalog;

  const catalogprice({Key? key, required this.catalog}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      children: [
        "\$${catalog.price}".text.color(mythemes.myblue).xl.bold.make(),
        ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                shape: MaterialStateProperty.all(const StadiumBorder()),
                backgroundColor: MaterialStateProperty.all(mythemes.myblue)),
            child: "Buy".text.make().py2())
      ],
    );
  }
}
