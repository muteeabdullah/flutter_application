import 'package:flutter/material.dart';
import 'package:flutter_application/catalog.dart';
import 'package:flutter_application/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'homepage.dart';

class Detailspage extends StatelessWidget {
  final item catalog;

  const Detailspage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Page',style: TextStyle(
        ),),
     //   foregroundColor: context.canvasColor,
        backgroundColor: context.cardColor,
      ),
      
      bottomNavigationBar: 
      Container(
        color: context.canvasColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}".text.xl3.bold.red900.make(),
            ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(const StadiumBorder()),
                    backgroundColor:
                        MaterialStateProperty.all(context.theme.primaryColor)),
                child: "Buy".text.xl.make())
          ],
        ).p24(),
      ),
      backgroundColor: context.cardColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h32(context),
            Expanded(
                child: VxArc(
              height: 30,
              edge: VxEdge.TOP,
              arcType: VxArcType.CONVEY,
              child: Container(
                width: context.screenWidth,
                color: context.canvasColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    catalog.name.text.bold.xl4.make(),
                    catalog.description.text.make(),
                  ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
