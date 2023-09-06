import 'exports.dart';

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
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 9,
                    blurRadius: 10,
                    offset: const Offset(0, 0),
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
                  offset: const Offset(0, 3),
                ),
              ],
              color: _primaryColor,
              // gradient: const LinearGradient(
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomRight,
              //   colors: [
              //     const Color(0xff0A3E89),
              //     const Color(0xff105ac4),
              //     const Color(0xff1057bd),
              //     const Color(0xff0A3E89),
              //   ],
              // ),
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
