import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:project/pages/ProfilePage.dart';
import 'package:project/widget/NewWidget.dart';
import 'package:project/widget/UpdateWidget.dart';
import 'package:project/widget/drawer.dart';
import 'package:project/widget/search.dart';
import 'package:project/models/product.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        toolbarHeight: 80.0,
        leading: IconButton(
            icon: const Icon(Icons.account_circle_rounded),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            }),
        leadingWidth: 100,
        title: Column(
          children: const [
            Text(
              "Ân Cinemas",
              style: TextStyle(
                color: Colors.red,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "Nơi Cảm Xúc Thăng Hoa",
              style: TextStyle(
                color: Colors.white54,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      endDrawer: MainDrawer(),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Search(),
              const SizedBox(height: 10.0),
              UpdateWidget("Phim sắp chiếu", Product.products),
              const SizedBox(height: 10.0),
              NewWidget("Phim đang chiếu", Product.movies),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const GNav(
        color: Colors.white,
        activeColor: Colors.white,
        gap: 8,
        tabBackgroundColor: Colors.grey,
        tabs: [
          GButton(icon: Icons.home, text: "Home"),
          GButton(icon: Icons.favorite, text: "Favorites"),
          GButton(
            icon: Icons.message_outlined,
            text: "Contact",
          ),
        ],
      ),
    );
  }
}
