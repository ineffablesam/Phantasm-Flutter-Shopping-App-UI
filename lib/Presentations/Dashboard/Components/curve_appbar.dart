import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_clipper.dart';

class DashboardCustomAppBar extends StatelessWidget {
  final Widget? leading;
  const DashboardCustomAppBar({
    super.key,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        expandedHeight: 100.h,
        collapsedHeight: 100.h,
        toolbarHeight: 100.h,
        pinned: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        stretch: false,
        titleSpacing: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: FlexibleSpaceBar(
          background: Stack(
            fit: StackFit.expand,
            alignment: Alignment.topCenter,
            children: [
              BackgroundWave(
                height: 290.h,
              ),
              Positioned(
                top: 45.h,
                child: Image.asset(
                  'assets/images/brand_logo.png',
                  height: 20.h,
                ),
              ),
              Positioned(
                top: 40.h,
                left: 10.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    leading ?? Container(),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
