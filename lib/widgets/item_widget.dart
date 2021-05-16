import 'package:flutter/material.dart';
import 'package:mobile_cataloge/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key key, @required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: (){
          print("${item.name}");
        },
        leading: Image.network(item.image,),
        title: Text(item.name),
        subtitle: Text(item.description),
        trailing: Text(
          "\u{20B9}${item.price}",
          textScaleFactor: 1.5,
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
