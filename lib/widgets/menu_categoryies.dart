import 'package:flutter/material.dart';

import 'package:menutify/models/Category.dart';
import 'package:menutify/screens/constants.dart';
import "package:collection/collection.dart";

// We need satefull widget for our categories

class Categories extends StatefulWidget {
  final List<Category> categories;
  const Categories({
    Key key,
    @required this.categories,
  }) : super(key: key);
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  // By default our first item will be selected

  List<String> categories;

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    categories = groupBy(widget.categories.map((e) => e.name).toList(),
        (obj) => obj as String).keys.toList();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? kTextColor : kTextLightColor,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: kDefaultPadding / 4), //top padding 5
              height: 2,
              width: 30,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
