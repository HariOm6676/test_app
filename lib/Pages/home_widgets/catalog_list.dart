import 'package:flutter/material.dart';
import 'package:test_app/Pages/home_detail_page.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalogue.dart';
import '../../widgets/themes.dart';
import '../catalog_image.dart';

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogImage(image: catalog.image)),
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                catalog.name.text.uppercase.lg.black.extraBold.make(),
                catalog.desc.text.make(),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: Vx.mH8,
                  children: [
                    "\$${catalog.price}".text.bold.xl.make(),
                    ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              MyTheme.darkBlueishColor),
                          shape: MaterialStateProperty.all(StadiumBorder()),
                        ),
                        child: "Add To Cart".text.make()),
                  ],
                )
              ]),
            ),
          )
        ],
      ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeDetailPage(
                      catalog: catalog,
                    ),
                  ),
                ),
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}