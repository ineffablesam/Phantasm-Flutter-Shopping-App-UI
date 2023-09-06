import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:phantasm/Infrastructure/Utils/custom_tap.dart';
import 'package:phantasm/Presentations/Admin/SalesPage/sales_page.dart';
import 'package:phantasm/Presentations/CartPage/cart_page.dart';
import 'package:phantasm/Presentations/CategoryPage/category_page.dart';
import 'package:phantasm/Presentations/ProfilePage/profile_page.dart';
import 'package:phantasm/Presentations/SideDrawer/side_drawer.dart';

import '../Dashboard/dashboard.dart';
import '../SearchPage/search_page.dart';
import '../SideDrawer/build_menu_tile.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  late AdvancedDrawerController
      _advancedDrawerController; // Declare the variable
  int _selectedIndex = 0;

  final List<Widget Function(AdvancedDrawerController)> _pages = [
    (controller) => Dashboard(
          controller: controller,
        ),
    (controller) => const SearchPage(),
    (controller) => const CategoryPage(),
    (controller) => const ProfilePage(),
  ];

  @override
  void initState() {
    _advancedDrawerController = AdvancedDrawerController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const _primaryColor = const Color(0xff0A3E89);
    return AdvancedDrawer(
      drawer: SideDrawer(
          content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 38.r,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 32.r,
                    backgroundColor: Colors.transparent,
                    backgroundImage: const AssetImage(
                      'assets/images/user_placeholder.jpeg',
                    ),
                  ),
                ),
                10.horizontalSpace,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'M. Alwan',
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'ID No: 23940586',
                      style: GoogleFonts.poppins(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          10.verticalSpace,
          Divider(
            color: Colors.grey.shade200,
            thickness: 0.5,
            endIndent: 30,
          ),
          10.verticalSpace,
          Padding(
            padding: EdgeInsets.all(8.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BuildMenuTile(
                  icon: IconlyBold.home,
                  title: 'Dashboard',
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const SalesPage(),
                        ));
                  },
                ),
                BuildMenuTile(
                  icon: IconlyBold.bag_2,
                  title: 'Orders',
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                    _advancedDrawerController.toggleDrawer();
                  },
                ),
                BuildMenuTile(
                  icon: IconlyBold.download,
                  title: 'Downloads',
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                    _advancedDrawerController.toggleDrawer();
                  },
                ),
                BuildMenuTile(
                  icon: IconlyBold.location,
                  title: 'Addresses',
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                    _advancedDrawerController.toggleDrawer();
                  },
                ),
                BuildMenuTile(
                  icon: IconlyBold.wallet,
                  title: 'Payment Methods',
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                    _advancedDrawerController.toggleDrawer();
                  },
                ),
                BuildMenuTile(
                  icon: IconlyBold.document,
                  title: 'Account details',
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                    _advancedDrawerController.toggleDrawer();
                  },
                ),
                BuildMenuTile(
                  icon: IconlyBold.discovery,
                  title: 'Transactions History',
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                    _advancedDrawerController.toggleDrawer();
                  },
                ),
                BuildMenuTile(
                  icon: IconlyBold.plus,
                  title: 'Make a Deposit',
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                    _advancedDrawerController.toggleDrawer();
                  },
                ),
                10.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: CustomTap(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 10.h),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              IconlyBold.logout,
                              color: const Color(0xff0A3E89),
                            ),
                            10.horizontalSpace,
                            Text(
                              "Logout".toUpperCase(),
                              style: GoogleFonts.poppins(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xff0A3E89),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xff3586C0),
              Color(0xff103676),
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -190.h,
              left: -20.h,
              child: Transform.rotate(
                angle: 90,
                child: Image.asset(
                  'assets/images/pattern_left.png',
                  width: 0.5.sw,
                ),
              ),
            ),
            Positioned(
              bottom: -90.h,
              left: -20.h,
              child: Image.asset(
                'assets/images/pattern_left.png',
                width: 0.5.sw,
              ),
            ),
            // Positioned(
            //   bottom: 0,
            //   left: 0,
            //   child: Image.asset(
            //     'assets/images/blue_smoke.png',
            //     width: 1.sw,
            //   ),
            // ),
          ],
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0x000000).withOpacity(0.4),
            offset: const Offset(-7, 0),
            blurRadius: 40,
            spreadRadius: -3,
          ),
          BoxShadow(
            color: const Color(0xffffff).withOpacity(0.2),
            offset: const Offset(-120, 0),
            blurRadius: 0,
            spreadRadius: -60,
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
      ),
      child: Scaffold(
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xffCC2E1A),
          child: const Icon(
            IconlyLight.buy,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.bottomToTop,
                child: const CartPage(),
              ),
            );
          },
        ),
        body: _pages.elementAt(_selectedIndex)(_advancedDrawerController),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          color: _primaryColor,
          height: 54.h,
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
            unselectedItemColor: const Color(0xff2680ff),
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
      ),
    );
  }
}
