import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:phantasm/Presentations/CategoryPage/category_page.dart';
import 'package:phantasm/Presentations/ProfilePage/profile_page.dart';

import '../Dashboard/dashboard.dart';
import '../SearchPage/search_page.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _selectedIndex = 0;
  // pages list
  final List<Widget> _pages = [
    const Dashboard(),
    const SearchPage(),
    const CategoryPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    const _primaryColor = const Color(0xff0A3E89);
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffCC2E1A),
        child: const Icon(
          IconlyLight.buy,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: _primaryColor,
        height: 59.h,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          selectedLabelStyle: GoogleFonts.poppins(
            fontSize: 8.sp,
            fontWeight: FontWeight.w400,
          ),
          unselectedLabelStyle: GoogleFonts.poppins(
            fontSize: 8.sp,
            fontWeight: FontWeight.w400,
          ),
          selectedItemColor: Colors.white,
          unselectedItemColor: Color(0xff2680ff),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                IconlyLight.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                IconlyLight.search,
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                IconlyLight.category,
              ),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                IconlyLight.profile,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
