import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:wallpape_app/pages/categories.dart';
import 'package:wallpape_app/pages/home_page.dart';
import 'package:wallpape_app/pages/search.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentTabIndex = 0;
  late List<Widget> pages;
  late HomePage home;
  late Categories categories;
  late Search search;
  late Widget currentPage;

  @override
  void initState() {
    home = HomePage();
    search = Search();
    categories = Categories();
    currentPage = HomePage();
    pages = [home, search, categories];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.black,
        height: 65,
        color: Colors.black,
        animationDuration: const Duration(milliseconds: 500),
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          });
        },
        items: const [
          Icon(
            Icons.home_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.search_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.category_outlined,
            color: Colors.white,
          ),
        ],
      ),
      body: pages[currentTabIndex],
    );
  }
}
