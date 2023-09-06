import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            pinned: true,
            expandedHeight: 87,
            stretch: true,
            title: Text(
              'Cart',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w800,
                fontSize: 20.sp,
                color: const Color(0xff31373E),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close_outlined,
                  color: Color(0xff31373E),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                60.verticalSpace,
                Lottie.asset(
                  "assets/lottie/empty_cart.json",
                  height: 250.h,
                ),
                20.verticalSpace,
                Text(
                  'Your cart is empty',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp,
                    color: const Color(0xff31373E),
                  ),
                ),
                5.verticalSpace,
                Text(
                  'Looks like you haven\'t added\nanything to your cart yet',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: const Color(0xff31373E),
                  ),
                ),
                // Go to shop button
                20.verticalSpace,
                Container(
                  width: 0.8.sw,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: TextButton(
                    style: ButtonStyle(
                      splashFactory: InkSparkle.splashFactory,
                      backgroundColor: MaterialStateProperty.all(
                        const Color(0xff2680FF),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Go to shop',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
