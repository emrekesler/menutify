import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:menutify/models/Restaurant.dart';
import 'package:menutify/screens/constants.dart';
import 'package:menutify/screens/restaurant_detail.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({
    Key key,
    this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
      ),
      width: size.width * 0.8,
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => RestaurantDetail(
                restaurant: restaurant,
              ),
            )),
        child: Column(
          children: <Widget>[
            Hero(
              tag: restaurant.name,
              child: Image(
                image: NetworkImage(restaurant.image),
                width: size.width * 0.8,
                height: size.height * 0.2,
                fit: BoxFit.cover,
              ),
            ),
            Container(
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
                    padding:
                        const EdgeInsets.only(left: 10, top: 10, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        AutoSizeText(
                          restaurant.name,
                          style:
                              TextStyle(color: Color(0xFF3E3F68), fontSize: 25),
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
            ),
          ],
        ),
      ),
    );
  }
}
