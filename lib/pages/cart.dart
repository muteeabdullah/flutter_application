//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_application/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Cart".text.xl2.make(),
      ),
      body: Column(
        children: [
          ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return const ListTile(
                title: Text('item 1'),
                trailing: Icon(Icons.dangerous),
                leading: Icon(Icons.done),
              );
            },
          ).p24().expand(),
          const Divider(
            color: Colors.red,
            thickness: 1,
          ),
          SizedBox(
            height: 120,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                "\$99999".text.xl4.make(),
                ElevatedButton(
                  
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(context.theme.primaryColor),
                        shape:
                            MaterialStateProperty.all(const StadiumBorder())),
                    onPressed: () {
                       ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: "Buying not supported yet".text.make()));
                    },
                    child: "buy".text.make()
                    ).w32(context)
              ],
            ).p0()
          )
        ],
      ),
    );
  }
}
