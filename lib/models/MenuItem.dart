import 'dart:convert';

import 'Category.dart';

class MenuItem {
  String name;
  String price;
  String explanation;
  String image;
  Category category;
  MenuItem({
    this.name,
    this.price,
    this.explanation,
    this.image,
    this.category,
  });

  MenuItem copyWith({
    String name,
    String price,
    String explanation,
    String image,
    Category category,
  }) {
    return MenuItem(
      name: name ?? this.name,
      price: price ?? this.price,
      explanation: explanation ?? this.explanation,
      image: image ?? this.image,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'explanation': explanation,
      'image': image,
      'category': category?.toMap(),
    };
  }

  static MenuItem fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MenuItem(
      name: map['name'],
      price: map['price'],
      explanation: map['explanation'],
      image: map['image'],
      category: Category.fromMap(map['category']),
    );
  }

  String toJson() => json.encode(toMap());

  static MenuItem fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'MenuItem(name: $name, price: $price, explanation: $explanation, image: $image, category: $category)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is MenuItem &&
        o.name == name &&
        o.price == price &&
        o.explanation == explanation &&
        o.image == image &&
        o.category == category;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        price.hashCode ^
        explanation.hashCode ^
        image.hashCode ^
        category.hashCode;
  }
}
