import 'exports.dart';

class BuildCategoriesSlider extends StatelessWidget {
  const BuildCategoriesSlider({
    super.key,
    required Color primaryColor,
  }) : _primaryColor = primaryColor;

  final Color _primaryColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Categories",
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: _primaryColor,
                ),
              ),
              Text(
                "See All",
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w300,
                  color: _primaryColor,
                ),
              ),
            ],
          ),
        ),
        20.verticalSpace,
        SizedBox(
          height: 130.h,
          child: ListView.builder(
            itemCount: categoriesData.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return Container(
                margin: EdgeInsets.only(
                  left: i == 0 ? 20.w : 0,
                  right: i == categoriesData.length - 1 ? 16.w : 10.w,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 90.h,
                      width: 90.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.w),
                        child: Image.asset(
                          categoriesData[i].image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    10.verticalSpace,
                    Text(
                      categoriesData[i].title,
                      style: GoogleFonts.poppins(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        color: _primaryColor,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
