import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';

import '../SharedComponents/page_appbar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            CustomPageAppBar(
              title: 'Search',
              isSearch: false,
            ),
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      constraints: BoxConstraints(
                        maxHeight: 123.h,
                        maxWidth: 0.89.sw,
                      ),
                      filled: true,
                      fillColor: Color(0xffECEDEF),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Search Categories',
                      hintStyle: const TextStyle(
                        color: Colors.grey,
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.grey,
                        ),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                  20.verticalSpace,
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recent Searches',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp,
                          ),
                        ),
                        Text(
                          'Clear All',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade500,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: ListTile(
                                onTap: () {},
                                title: Text(
                                  'Search $index',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey.shade500,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                trailing: const Icon(
                                  // return arrow
                                  Icons.arrow_forward_ios,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
