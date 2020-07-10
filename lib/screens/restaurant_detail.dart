import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:menutify/models/MenuItem.dart';

import 'package:menutify/models/Restaurant.dart';
import "package:collection/collection.dart";
import 'constants.dart';

class RestaurantDetail extends StatefulWidget {
  RestaurantDetail({
    Key key,
    @required this.restaurant,
  }) : super(key: key);
  final Restaurant restaurant;

  @override
  _RestaurantDetailState createState() => _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail> {
  ScrollController _controller;

  @override
  void initState() {
    super.initState();

    _controller = ScrollController();
    _controller.addListener((_scrollListener));
  }

  double height = 1;
  int selectedIndex = 0;
  List<String> categories = List<String>();

  List<MenuItem> menus = List<MenuItem>();

  _scrollListener() {
    setState(() {
      if (_controller.offset < 100) height = _controller.offset;
    });
  }

  @override
  Widget build(BuildContext context) {
    categories.clear();
    categories.add("Hepsi");

    categories.addAll(groupBy(
        widget.restaurant.menus
            .map((e) => e.category)
            .toList()
            .map((e) => e.name)
            .toList(),
        (obj) => obj as String).keys.toList());

    if (selectedIndex != 0)
      menus = widget.restaurant.menus
          .where(
              (element) => element.category.name == categories[selectedIndex])
          .toList();
    else
      menus = widget.restaurant.menus;

    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: (MediaQuery.of(context).size.height * 0.4) - height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 1.0,
                    ),
                  ],
                ),
                child: ClipRRect(
                  // borderRadius: BorderRadius.only(
                  //     bottomLeft: Radius.circular(30),
                  //     bottomRight: Radius.circular(10)),
                  // // child: Image(image: CachedNetwork(), fit: BoxFit.cover),
                  child: Hero(
                    tag: widget.restaurant.name,
                    child: Image(
                      image: NetworkImage(widget.restaurant.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30.0,
                      color: Colors.white,
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),
              ),
              // Positioned(
              //   left: 20.0,
              //   bottom: 20.0,
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: <Widget>[
              //       SizedBox(
              //         width: MediaQuery.of(context).size.width,
              //         child: Text(
              //           "resname",
              //           style: TextStyle(
              //             color: Colors.white,
              //             fontSize: 33.0,
              //             fontWeight: FontWeight.w600,
              //             letterSpacing: 1.2,
              //           ),
              //           maxLines: 3,
              //           overflow: TextOverflow.ellipsis,
              //         ),
              //       ),
              //       Row(
              //         children: <Widget>[
              //           Icon(
              //             Icons.tag_faces,
              //             size: 15.0,
              //             color: Colors.white70,
              //           ),
              //           SizedBox(width: 5.0),
              //           SizedBox(
              //             width: MediaQuery.of(context).size.width,
              //             child: Text(
              //               "test",
              //               style: TextStyle(
              //                 color: Colors.white70,
              //                 fontSize: 15.0,
              //               ),
              //               maxLines: 1,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
          RestaurantInfo(
            restaurant: widget.restaurant,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: SizedBox(
              height: 25,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) => buildCategory(index),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: (MediaQuery.of(context).size.height * 0.5) + height,
              child: ListView.separated(
                  separatorBuilder: (BuildContext ctxt, int index) => Divider(),
                  controller: _controller,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: false,
                  itemCount: menus.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    MenuItem menu = menus[index];

                    return Card(
                      child: ListTile(
                        leading: AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              image: DecorationImage(
                                  image: NetworkImage(menu.image),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                        trailing: Text(menu.price),
                        title: Text(menu.name),
                        isThreeLine: true,
                        subtitle: Text(menu.explanation),
                        onTap: () => {
                          howAlertDialog(context),
                        },
                        onLongPress: () => {
                          howAlertDialog2(context, menu),
                        },
                      ),
                    );
                  }),
            ),
          ),
        ],
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

  howAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Tek Tıklama"),
      content: Text("Bu Bir Widgettır. Tek Tıkalama ile açılır"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  howAlertDialog2(BuildContext context, MenuItem item) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("Kapat"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(item.name),
      content: Image(
        image: NetworkImage(item.image),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class RestaurantInfo extends StatelessWidget {
  const RestaurantInfo({
    Key key,
    @required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding / 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 30,
            color: kTextColor.withOpacity(0.23),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                AutoSizeText(
                  restaurant.name,
                  style: TextStyle(color: Color(0xFF3E3F68), fontSize: 25),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                  margin: const EdgeInsets.only(left: 10),
                  child: AutoSizeText(
                    restaurant.firstCat,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xFFFF8C48),
                      Color(0xFFFF5673),
                    ]),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 1.0,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                  margin: const EdgeInsets.only(left: 10),
                  child: AutoSizeText(
                    restaurant.distince,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                  decoration: BoxDecoration(
                    // gradient: LinearGradient(colors: [
                    //   Color(0xFFFF8C48),
                    //   Color(0xFFFF5673),
                    // ]),
                    color: Color(0xFF848DFF),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 1.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: AutoSizeText(
              restaurant.address,
              style: TextStyle(fontSize: 15, color: Color(0xFF142E6B)),
            ),
          ),
        ],
      ),
    );
  }
}
