import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phantasm/Application/Models/categories_data.dart';
import 'package:phantasm/Infrastructure/Utils/custom_tap.dart';

import '../SharedComponents/page_appbar.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            CustomPageAppBar(
              title: 'Categories',
              isSearch: false,
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Featured Categories',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w800,
                            fontSize: 12.sp,
                          ),
                        ),
                        Text(
                          ' (4)',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                  20.verticalSpace,
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    itemCount: categoriesData.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return AnimationConfiguration.staggeredGrid(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        columnCount: categoriesData.length,
                        child: ScaleAnimation(
                          child: FadeInAnimation(
                            child: CustomTap(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 10,
                                      blurRadius: 20,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      categoriesData[index].image,
                                      height: 100.h,
                                      width: 100.w,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            categoriesData[index].title,
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.sp,
                                              color: const Color(0xff31373E),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  20.verticalSpace,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'All Categories',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w800,
                            fontSize: 12.sp,
                          ),
                        ),
                        Text(
                          ' (9)',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                  20.verticalSpace,
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    itemCount: categoriesData.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return AnimationConfiguration.staggeredGrid(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        columnCount: categoriesData.length,
                        child: ScaleAnimation(
                          child: FadeInAnimation(
                            child: CustomTap(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 10,
                                      blurRadius: 20,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      categoriesData[index].image,
                                      height: 100.h,
                                      width: 100.w,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            categoriesData[index].title,
                                            style: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.sp,
                                              color: const Color(0xff31373E),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  100.verticalSpace,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
