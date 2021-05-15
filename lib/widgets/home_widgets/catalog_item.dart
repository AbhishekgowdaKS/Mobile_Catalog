import 'package:flutter/material.dart';
import 'package:mobile_cataloge/models/catalog.dart';
import 'package:mobile_cataloge/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog_image.dart';

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
          children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child: CatalogImage(image: catalog.image)
            ),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg
                    .color(MyTheme.darkBluishColor)
                    .bold
                    .make(),
                catalog.description.text.textStyle(context.captionStyle)
                    .make()
                    .pOnly(right: 16),
                10.heightBox, //SizedBox using velocity_Vx
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\u{20B9}${catalog.price}".text.bold.xl.make(),
                    ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                MyTheme.darkBluishColor),
                            shape: MaterialStateProperty.all(StadiumBorder())
                        ),
                        child: "Add to cart".text.make()
                    ),
                  ],
                ).pOnly(right: 8.0)
              ],
            ))
          ],
        )
    ).white.rounded.square(150).make().py16();
  }
}