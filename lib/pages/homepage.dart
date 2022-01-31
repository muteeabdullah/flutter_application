import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application/catalog.dart';
import 'package:flutter_application/utils/routes.dart';
import 'package:flutter_application/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'detailspage.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

// ignore: camel_case_types
class _homepageState extends State<homepage> {
  get itemBuilder => null;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/products.json");
    var decodedData = jsonDecode(catalogJson);
    var productsdata = decodedData["products"];
    // ignore: non_constant_identifier_names
    catalogmodel.items = List.from(productsdata)
        // ignore: non_constant_identifier_names
        .map<item>((Item) => item.fromMap(Item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, Myroutes.cartroute),
        child: const Icon(CupertinoIcons.cart),
        backgroundColor: context.primaryColor,
        foregroundColor: Colors.white,
      ),
      backgroundColor: context.cardColor,
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
        // ignore: deprecated_member_use
        "Catalog App".text.bold.color(context.theme.buttonColor).xl5.make(),
        // ignore: deprecated_member_use
        "Trending products".text.color(context.theme.buttonColor).xl2.make(),
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
          final catalog = catalogmodel.getByPos(index);
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
            catalog.name.text.bold.color(context.accentColor).make().py8(),
            catalog.description.text.make(),
            catalogprice(catalog: catalog)
          ],
        ))
      ],
    )).color(context.canvasColor).rounded.square(150).make().py12();
  }
}

class catalogimage extends StatelessWidget {
  final String image;

  const catalogimage({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .color(context.cardColor)
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
            onPressed: () {
            },
            style: ButtonStyle(
                shape: MaterialStateProperty.all(const StadiumBorder()),
                backgroundColor:
                    MaterialStateProperty.all(context.theme.primaryColor)),
            child: "Add to Cart".text.make().py2())
      ],
    );
  }
}
