import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'Components/app_bar_content.dart';
import 'Components/brand_logos.dart';
import 'Components/carousel_slider.dart';
import 'Components/categories_slider.dart';
import 'Components/cta_banner.dart';
import 'Components/curve_appbar.dart';
import 'Components/featured_products.dart';
import 'Components/search_bar.dart';

class Dashboard extends StatefulWidget {
  final AdvancedDrawerController controller;
  const Dashboard({super.key, required this.controller});

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
                DashboardCustomAppBar(
                  leading: Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: IconButton(
                      onPressed: _handleMenuButtonPressed,
                      icon: ValueListenableBuilder<AdvancedDrawerValue>(
                        valueListenable: widget.controller,
                        builder: (_, value, __) {
                          return AnimatedSwitcher(
                            duration: const Duration(milliseconds: 250),
                            child: Icon(
                              value.visible ? Icons.clear : Icons.menu,
                              color: _primaryColor,
                              key: ValueKey<bool>(value.visible),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    widget.controller.showDrawer();
  }
}
