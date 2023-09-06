import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_clipper.dart';

class DashboardCustomAppBar extends StatelessWidget {
  const DashboardCustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        expandedHeight: 130.h,
        collapsedHeight: 130.h,
        toolbarHeight: 130.h,
        pinned: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
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
                top: 20.h,
                child: Image.asset(
                  'assets/images/brand_logo.png',
                  height: 90.h,
                ),
              ),
            ],
          ),
        ));
  }
}
