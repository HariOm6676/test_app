import "package:flutter/material.dart";
import 'package:test_app/widgets/themes.dart';

import 'package:velocity_x/velocity_x.dart';

import '../models/catalogue.dart';
class HomeDetailPage extends StatelessWidget {
 final Item catalog;

  const HomeDetailPage({super.key, required this.catalog});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color:Colors.white,
        child: ButtonBar(
           alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: Vx.mH8,
                  children: [
                    "\$${catalog.price}".text.bold.xl4.red800.make(),
                    ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(MyTheme.darkBlueishColor),
                          shape: MaterialStateProperty.all(StadiumBorder()),
                        ),
                        child: "Buy".text.make()).wh(100,50),
                  ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: Image.network(catalog.image),
            ).h32(context),
            Expanded(child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                  children: [
                     catalog.name.text.xl4.color(MyTheme.darkBlueishColor).bold.make(),
              catalog.desc.text.xl.make(),
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