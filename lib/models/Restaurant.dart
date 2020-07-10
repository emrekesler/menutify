import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'MenuItem.dart';

class Restaurant {
  String name;
  String address;
  String image;
  String firstCat;
  String distince;
  List<MenuItem> menus;
  Restaurant({
    this.name,
    this.address,
    this.image,
    this.firstCat,
    this.distince,
    this.menus,
  });

  Restaurant copyWith({
    String name,
    String address,
    String image,
    String firstCat,
    String distince,
    List<MenuItem> menus,
  }) {
    return Restaurant(
      name: name ?? this.name,
      address: address ?? this.address,
      image: image ?? this.image,
      firstCat: firstCat ?? this.firstCat,
      distince: distince ?? this.distince,
      menus: menus ?? this.menus,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'image': image,
      'firstCat': firstCat,
      'distince': distince,
      'menus': menus?.map((x) => x?.toMap())?.toList(),
    };
  }

  static Restaurant fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Restaurant(
      name: map['name'],
      address: map['address'],
      image: map['image'],
      firstCat: map['firstCat'],
      distince: map['distince'],
      menus: List<MenuItem>.from(map['menus']?.map((x) => MenuItem.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  static Restaurant fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Restaurant(name: $name, address: $address, image: $image, firstCat: $firstCat, distince: $distince, menus: $menus)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Restaurant &&
        o.name == name &&
        o.address == address &&
        o.image == image &&
        o.firstCat == firstCat &&
        o.distince == distince &&
        listEquals(o.menus, menus);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        address.hashCode ^
        image.hashCode ^
        firstCat.hashCode ^
        distince.hashCode ^
        menus.hashCode;
  }
}
