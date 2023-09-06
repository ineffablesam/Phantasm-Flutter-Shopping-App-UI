import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:phantasm/Application/Models/categories_data.dart';
import 'package:phantasm/Infrastructure/Utils/custom_tap.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Application/Models/brand_data.dart';
import '../../Application/Models/products.dart';
import 'Components/curve_appbar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    const _primaryColor = const Color(0xff0A3E89);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
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
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          color: _primaryColor,
          height: 59.h,
          child: Container(
              decoration: BoxDecoration(
                  // gradient: LinearGradient(
                  //   begin: Alignment.topLeft,
                  //   end: Alignment.bottomRight,
                  //   colors: [
                  //     const Color(0xff0A3E89),
                  //     const Color(0xff105ac4),
                  //     const Color(0xff1057bd),
                  //     const Color(0xff0A3E89),
                  //   ],
                  // ),
                  )),
        ),
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
                      const BuildAppBarContent(primaryColor: _primaryColor),
                      20.verticalSpace,
                      const BuildSearchBar(primaryColor: _primaryColor),
                      20.verticalSpace,
                      // Carousel
                      const BuildCarousel(),
                      // Build categories
                      20.verticalSpace,
                      const BuildCategoriesSlider(primaryColor: _primaryColor),
                      // CTA Banner
                      10.verticalSpace,
                      const BuildCtaBanner(),
                      20.verticalSpace,
                      // Build Brands
                      const BuildBrandLogos(),
                      20.verticalSpace,
                      // Featured Products
                      const BuildFeaturedProducts(),
                      50.verticalSpace,
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

class BuildFeaturedProducts extends StatelessWidget {
  const BuildFeaturedProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/pattern_left.png",
              fit: BoxFit.cover,
            ),
            Image.asset(
              "assets/images/pattern_right.png",
              fit: BoxFit.cover,
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "Featured Products",
              style: GoogleFonts.poppins(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xff0A3E89),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: productsData.length,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.7,
                      mainAxisSpacing: 10.h,
                      crossAxisSpacing: 10.w,
                      crossAxisCount: 2),
                  itemBuilder: (context, i) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      height: 160.h,
                      width: 100.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            alignment: Alignment.topRight,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    30.verticalSpace,
                                    Image.asset(
                                      productsData[i].image,
                                      fit: BoxFit.contain,
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 13.h,
                                right: 12.w,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xffAB2525),
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color(0xffAB2525)
                                                .withOpacity(0.15),
                                            spreadRadius: 12,
                                            blurRadius: 20,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        shape: BoxShape.circle,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(7.h),
                                        child: Icon(
                                          Icons.favorite_rounded,
                                          color: Colors.white,
                                          size: 21.sp,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffFAFAFA),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 10.h),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        productsData[i].title,
                                        style: GoogleFonts.sen(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                          color: const Color(0xff32343E),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          left: 5.w,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color(0xffFE724C)
                                                  .withOpacity(0.2),
                                              spreadRadius: 1,
                                              blurRadius: 7,
                                              offset: const Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(3.h),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: 12.sp,
                                              ),
                                              Text(
                                                productsData[i].rating,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    productsData[i].category,
                                    style: GoogleFonts.sen(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff646982),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "\$${productsData[i].price}",
                                        style: GoogleFonts.sen(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w900,
                                          color: const Color(0xff181C2E),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.add_box_outlined,
                                            color: const Color(0xffFB7A8E),
                                            size: 16.sp,
                                          ),
                                          5.horizontalSpace,
                                          Text(
                                            "Add to Cart",
                                            style: GoogleFonts.heebo(
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.normal,
                                              color: const Color(0xff181C2E),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        )
      ],
    );
  }
}

class BuildBrandLogos extends StatefulWidget {
  const BuildBrandLogos({
    super.key,
  });

  @override
  State<BuildBrandLogos> createState() => _BuildBrandLogosState();
}

class _BuildBrandLogosState extends State<BuildBrandLogos> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
      ),
      decoration: const BoxDecoration(
        color: Color(
          0xffFFF9F9,
        ),
      ),
      child: Column(
        children: [
          Text(
            "Our Brands",
            style: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xff0A3E89),
            ),
          ),
          ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              clipBehavior: Clip.none,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, im) {
                brandData.shuffle();
                return Container(
                  height: 60.h,
                  child: ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    clipBehavior: Clip.none,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      final brandIndex = i % brandData.length;
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: i == 0 ? 20.w : 0,
                              right: i == brandData.length - 1 ? 16.w : 10.w,
                            ),
                            height: 45.h,
                            width: 100.h,
                            padding: EdgeInsets.all(5.w),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50.r),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color(0xffCEB87E).withOpacity(0.6),
                                  spreadRadius: 1,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Image.asset(
                              brandData[brandIndex].image,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              }),
        ],
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
