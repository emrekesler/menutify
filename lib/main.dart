import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menutify/screens/home.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(textTheme: GoogleFonts.josefinSansTextTheme()),
      title: 'Material App',
      home: Scaffold(
          body: SafeArea(
            child: HomeScreen(),
          ),
          drawer: Drawer(),
          endDrawer: Drawer(),
          bottomNavigationBar: ConvexAppBar(
            backgroundColor: Colors.white,
            color: Color(0xFF222455),
            activeColor: Color(0xFFFF3B30),
            items: [
              TabItem(icon: Icons.home),
              TabItem(icon: Icons.map),
              TabItem(icon: Icons.blur_on),
              TabItem(icon: Icons.message),
              TabItem(icon: Icons.people)
            ],
            initialActiveIndex: 2, //optional, default as 0
            onTap: (int i) => print('click index=$i'),
          )),
    );
  }
}
