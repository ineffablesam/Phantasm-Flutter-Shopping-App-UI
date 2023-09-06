import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:phantasm/Application/Models/categories_data.dart';
import 'package:phantasm/Infrastructure/Utils/custom_tap.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Components/curve_appbar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final _primaryColor = const Color(0xff0A3E89);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverStack(
              children: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      130.verticalSpace,
                      // Appbar content
                      BuildAppBarContent(primaryColor: _primaryColor),
                      20.verticalSpace,
                      BuildSearchBar(primaryColor: _primaryColor),
                      20.verticalSpace,
                      // Carousel
                      const BuildCarousel(),
                      // Build categories
                      20.verticalSpace,
                      BuildCategoriesSlider(primaryColor: _primaryColor),
                      // CTA Banner
                      10.verticalSpace,
                      const BuildCtaBanner(),
                      20.verticalSpace,
                      // Build Brands
                    ],
                  ),
                ),
                const DashboardCustomAppBar(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BuildCtaBanner extends StatelessWidget {
  const BuildCtaBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.h),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Image.asset(
          "assets/images/cta_banner.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class BuildCategoriesSlider extends StatelessWidget {
  const BuildCategoriesSlider({
    super.key,
    required Color primaryColor,
  }) : _primaryColor = primaryColor;

  final Color _primaryColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: _primaryColor,
                ),
              ),
              Text(
                "See All",
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                  color: _primaryColor,
                ),
              ),
            ],
          ),
        ),
        20.verticalSpace,
        SizedBox(
          height: 130.h,
          child: ListView.builder(
            itemCount: categoriesData.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return Container(
                margin: EdgeInsets.only(
                  left: i == 0 ? 20.w : 0,
                  right: i == categoriesData.length - 1 ? 16.w : 10.w,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 90.h,
                      width: 90.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.w),
                        child: Image.asset(
                          categoriesData[i].image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    10.verticalSpace,
                    Text(
                      categoriesData[i].title,
                      style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        color: _primaryColor,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class BuildCarousel extends StatefulWidget {
  const BuildCarousel({super.key});

  @override
  State<BuildCarousel> createState() => _BuildCarouselState();
}

class _BuildCarouselState extends State<BuildCarousel> {
  late CarouselController carouselController;
  int _activeCarouselIndex = 0;
  @override
  void initState() {
    carouselController = CarouselController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const _primaryColor = Color(0xff0A3E89);
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    _activeCarouselIndex = index;
                  });
                },
                height: 100.h,
                aspectRatio: 16 / 1,
                viewportFraction: 0.8,
                enlargeCenterPage: true,
                enlargeFactor: 0.2,
                autoPlay: true,
              ),
              items: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.asset(
                    "assets/images/c_image_1.png",
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.asset(
                    "assets/images/c_image_2.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Material(
                    elevation: 15,
                    shape: const CircleBorder(),
                    child: CustomTap(
                      onTap: () {
                        carouselController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear);
                      },
                      child: CircleAvatar(
                        radius: 20.r,
                        backgroundColor: Colors.grey.shade100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              size: 16.sp,
                              color: _primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Material(
                    elevation: 15,
                    shape: const CircleBorder(),
                    child: CustomTap(
                      onTap: () {
                        carouselController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear);
                      },
                      child: CircleAvatar(
                        radius: 20.r,
                        backgroundColor: Colors.grey.shade100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.sp,
                              color: _primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        20.verticalSpace,
        AnimatedSmoothIndicator(
          activeIndex: _activeCarouselIndex,
          count: 2,
          effect: WormEffect(
            dotHeight: 8.h,
            dotWidth: 8.w,
            dotColor: Colors.grey.shade300,
            activeDotColor: _primaryColor,
          ),
        ),
      ],
    );
  }
}

class BuildSearchBar extends StatelessWidget {
  const BuildSearchBar({
    super.key,
    required Color primaryColor,
  }) : _primaryColor = primaryColor;

  final Color _primaryColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Search field
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              height: 46.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: _primaryColor,
                  ),
                  10.horizontalSpace,
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Best Vape",
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w300,
                          color: _primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        10.horizontalSpace,

        CustomTap(
          onTap: () {
            showCupertinoModalBottomSheet(
              context: context,
              bounce: true,
              backgroundColor: Colors.grey.shade100,
              topRadius: Radius.circular(37.r),
              builder: (context) => Material(
                child: Container(
                  alignment: Alignment.center,
                  height: 300.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Filter Sheet",
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: _primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          child: Container(
            height: 46.h,
            width: 46.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xff0A3E89),
                  const Color(0xff105ac4),
                  const Color(0xff1057bd),
                  const Color(0xff0A3E89),
                ],
              ),
            ),
            child: const Icon(
              Icons.filter_list_outlined,
              color: Colors.white,
            ),
          ),
        ),
        10.horizontalSpace,
      ],
    );
  }
}

class BuildAppBarContent extends StatelessWidget {
  const BuildAppBarContent({
    super.key,
    required Color primaryColor,
  }) : _primaryColor = primaryColor;

  final Color _primaryColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome",
                style: GoogleFonts.poppins(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w300,
                  color: _primaryColor,
                ),
              ),
              Text(
                "Mr. Alwan",
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: _primaryColor,
                ),
              )
            ],
          ),
          Row(
            children: [
              Badge(
                backgroundColor: Colors.green,
                offset: const Offset(-3, 1),
                label: Text(
                  "2",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                child: CircleAvatar(
                  radius: 20.r,
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    Icons.add_shopping_cart_outlined,
                    color: _primaryColor,
                  ),
                ),
              ),
              Badge(
                backgroundColor: Colors.green,
                offset: const Offset(-7, 1),
                label: Text(
                  "2",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                child: CircleAvatar(
                  radius: 20.r,
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    Icons.notifications_none_outlined,
                    color: _primaryColor,
                  ),
                ),
              ),
              // user profile
              CircleAvatar(
                radius: 19.r,
                backgroundColor: Colors.transparent,
                backgroundImage: const AssetImage(
                  'assets/images/user_placeholder.jpeg',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
