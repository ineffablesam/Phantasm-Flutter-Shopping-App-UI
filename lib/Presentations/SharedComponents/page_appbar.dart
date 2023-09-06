import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phantasm/Presentations/SharedComponents/gradient_clipper.dart';

class CustomPageAppBar extends StatelessWidget {
  final String title;
  final bool? isSearch;
  final Widget? bottom;
  const CustomPageAppBar({
    super.key,
    required this.title,
    this.bottom,
    this.isSearch,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      collapsedHeight: 10,
      toolbarHeight: 1,
      automaticallyImplyLeading: false,
      pinned: true,
      expandedHeight: 100.h,
      stretch: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.none,
        background: Stack(
          fit: StackFit.expand,
          alignment: Alignment.topCenter,
          children: [
            GradientClipper(height: 90.h),
            Positioned(
              top: -200.h,
              left: 90.h,
              child: Transform.rotate(
                angle: -40,
                child: Image.asset(
                  'assets/images/pattern_right.png',
                  width: 0.4.sw,
                  opacity: AlwaysStoppedAnimation<double>(0.3),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.w, top: 40.h),
                  child: Text(title,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w800,
                        fontSize: 30.sp,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
