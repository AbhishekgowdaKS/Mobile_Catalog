import 'dart:convert';

class CatalogModel {
  // static final catModel = CatalogModel._internal();  // ***************
  // CatalogModel._internal();                          // Singleton class
  // factory CatalogModel() => catModel;                // ***************

  static List<Item> items;

  //Get Item by ID
  Item getById(int id) => items.firstWhere((element) => element.id == id, orElse: null);

  // Get Item by position
  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String description;
  final num price;
  final String color;
  final String image;

  Item(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.color,
      this.image});

  Item copyWith({
    int id,
    String name,
    String description,
    num price,
    String color,
    String image,
  }) {
    return Item(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        price: price ?? this.price,
        color: color ?? this.price,
        image: image ?? this.image);
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "price": price,
      "color": color,
      "image": image
    };
  }

  factory Item.fromMap(Map<dynamic, dynamic> map) {
    if (map == null) return null;

    return Item(
        id: map["id"],
        name: map["name"],
        description: map["description"],
        price: map["price"],
        color: map["color"],
        image: map["image"]);
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return "Item(id: $id, name: $name, description: $description, price: $price, color: $color, image: $image)";
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Item &&
        o.id == id &&
        o.name == name &&
        o.description == description &&
        o.price == price &&
        o.color == color &&
        o.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        price.hashCode ^
        color.hashCode ^
        image.hashCode;
  }
}
