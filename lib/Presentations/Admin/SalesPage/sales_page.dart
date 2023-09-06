import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phantasm/Infrastructure/Utils/custom_tap.dart';

import '../../SharedComponents/gradient_clipper.dart';

class SalesPage extends StatelessWidget {
  const SalesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xffCC2E1A),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 24.sp,
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            collapsedHeight: 87.h,
            toolbarHeight: 1,
            automaticallyImplyLeading: false,
            pinned: true,
            elevation: 0,
            expandedHeight: 87.h,
            stretch: false,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.none,
              background: Stack(
                fit: StackFit.expand,
                alignment: Alignment.topCenter,
                children: [
                  GradientClipper(height: 80.h),
                  Positioned(
                    top: -200.h,
                    left: 90.h,
                    child: Transform.rotate(
                      angle: -40,
                      child: Image.asset(
                        'assets/images/pattern_right.png',
                        width: 0.4.sw,
                        opacity: const AlwaysStoppedAnimation<double>(0.3),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 24.sp,
                        ),
                      ),
                      Text("Dashboard",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w300,
                            fontSize: 16.sp,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const _buildStatsCard(
                  title: "Quantity to be packed",
                  value: "200",
                  color: Color(0xFFF8EC7D),
                  imagePath: 'assets/icons/admin_icon_1.png',
                ),
                20.verticalSpace,
                const _buildStatsCard(
                  title: "Packages to be shipped",
                  value: "198",
                  color: Color(0xFFE8F0F9),
                  imagePath: 'assets/icons/admin_icon_2.png',
                ),
                20.verticalSpace,
                const _buildStatsCard(
                  title: "Packages to be delivered",
                  value: "152",
                  color: Color(0xFFE8F0F9),
                  imagePath: 'assets/icons/admin_icon_3.png',
                ),
                20.verticalSpace,
                const _buildStatsCard(
                  title: "Quantity to be invoiced",
                  value: "220",
                  color: Color(0xFFF8EC7D),
                  imagePath: 'assets/icons/admin_icon_4.png',
                ),
                20.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Row(
                    children: [
                      Text(
                        "Inventory Summary",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          color: const Color(0xFF2D3845),
                        ),
                      )
                    ],
                  ),
                ),
                10.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 30.r,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.h, vertical: 10.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 150.h,
                            width: 140.h,
                            decoration: BoxDecoration(
                              color: Color(0xff90DFAA).withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "412",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 32.sp,
                                    color: const Color(0xFF2D3845),
                                  ),
                                ),
                                Text(
                                  "In Hand",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                    color: const Color(0xFF2D3845),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 150.h,
                            width: 140.h,
                            decoration: BoxDecoration(
                              color: Color(0xffF8EC7D).withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "346",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 32.sp,
                                    color: const Color(0xFF2D3845),
                                  ),
                                ),
                                Text(
                                  "to be received",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                    color: const Color(0xFF2D3845),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                20.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Developed by Samuel Philip for Phantasm",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w200,
                          fontSize: 12.sp,
                          color: const Color(0xFF2D3845),
                        ),
                      )
                    ],
                  ),
                ),
                50.verticalSpace,
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _buildStatsCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final String imagePath;
  const _buildStatsCard({
    super.key,
    required this.title,
    required this.value,
    required this.color,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      child: CustomTap(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: [
              BoxShadow(
                color: const Color(0xffBCFFFF).withOpacity(0.6),
                blurRadius: 30.r,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40.r,
                      backgroundColor: color.withOpacity(0.3),
                      child: Image.asset(imagePath),
                    ),
                    20.horizontalSpace,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          value,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            fontSize: 28.sp,
                            color: const Color(0xFF2D3845),
                          ),
                        ),
                        Text(
                          title,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: const Color(0xFF2D3845),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: const Color(0xFF2D3845),
                  size: 16.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
