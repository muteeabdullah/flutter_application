import 'package:flutter/material.dart';
import 'package:flutter_application/catalog.dart';

import '../catalog.dart';

class itemWidget extends StatelessWidget {
  final item Item;
  const itemWidget({Key? key, required this.Item})
      : assert(Item != null),
        super(key: key);

  get image => null;

  // const itemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print("${Item.name} pressed");
        },
        leading: Image.network(Item.image),
        title: Text(Item.name),
        subtitle: Text(Item.description),
        trailing: Text(
          "\$${Item.price}",
          textScaleFactor: 1.5,
          // ignore: prefer_const_constructors
          style:
              TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
