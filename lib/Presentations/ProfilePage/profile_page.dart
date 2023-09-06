import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../SharedComponents/page_appbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            CustomPageAppBar(
              title: 'Profile',
              isSearch: false,
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Text('Profile Page',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w800,
                        fontSize: 30.sp,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
