import 'dart:convert';

class Category {
  String name;
  int id;
  Category({
    this.name,
    this.id,
  });

  Category copyWith({
    String name,
    int id,
  }) {
    return Category(
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
    };
  }

  static Category fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Category(
      name: map['name'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  static Category fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Category(name: $name, id: $id)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Category && o.name == name && o.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}
