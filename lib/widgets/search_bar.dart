import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 30),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Ara",
                      icon: Icon(Icons.search),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  // onPressed: () => showModalBottomSheet(
                  //     context: context,
                  //     builder: (context) {
                  //       return Container(
                  //         child: Column(
                  //           children: <Widget>[
                  //             ListTile(
                  //               leading: Icon(Icons.ac_unit),
                  //               title: Text("Emre"),
                  //             ),
                  //             ListTile(
                  //               leading: Icon(Icons.ac_unit),
                  //               title: Text("Emre"),
                  //             ),
                  //             ListTile(
                  //               leading: Icon(Icons.ac_unit),
                  //               title: Text("Emre"),
                  //             ),
                  //             ListTile(
                  //               leading: Icon(Icons.ac_unit),
                  //               title: Text("Emre"),
                  //             ),
                  //           ],
                  //         ),
                  //       );
                  //     }),
                  icon: Icon(Icons.filter_list),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
