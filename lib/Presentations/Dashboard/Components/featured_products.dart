import 'exports.dart';

class BuildFeaturedProducts extends StatelessWidget {
  const BuildFeaturedProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/pattern_left.png",
              fit: BoxFit.cover,
            ),
            Image.asset(
              "assets/images/pattern_right.png",
              fit: BoxFit.cover,
            ),
          ],
        ),
        Column(
          children: [
            Text(
              "Featured Products",
              style: GoogleFonts.poppins(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xff0A3E89),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.7,
                      mainAxisSpacing: 10.h,
                      crossAxisSpacing: 10.w,
                      crossAxisCount: 2),
                  itemBuilder: (context, i) {
                    return CustomTap(
                      onTap: () {
                        HapticFeedback.lightImpact();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        height: 160.h,
                        width: 100.w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Stack(
                              alignment: Alignment.topRight,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      30.verticalSpace,
                                      Image.asset(
                                        productsData[i].image,
                                        fit: BoxFit.contain,
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 13.h,
                                  right: 12.w,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0xffAB2525),
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color(0xffAB2525)
                                                  .withOpacity(0.15),
                                              spreadRadius: 12,
                                              blurRadius: 20,
                                              offset: const Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(7.h),
                                          child: Icon(
                                            Icons.favorite_rounded,
                                            color: Colors.white,
                                            size: 21.sp,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xffFAFAFA),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 10.h),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          productsData[i].title,
                                          style: GoogleFonts.sen(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold,
                                            color: const Color(0xff32343E),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                            left: 5.w,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color(0xffFE724C)
                                                    .withOpacity(0.2),
                                                spreadRadius: 1,
                                                blurRadius: 7,
                                                offset: const Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(3.h),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                  size: 12.sp,
                                                ),
                                                Text(
                                                  productsData[i].rating,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w300,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      productsData[i].category,
                                      style: GoogleFonts.sen(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xff646982),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "\$${productsData[i].price}",
                                          style: GoogleFonts.sen(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w900,
                                            color: const Color(0xff181C2E),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.add_box_outlined,
                                              color: const Color(0xffFB7A8E),
                                              size: 16.sp,
                                            ),
                                            5.horizontalSpace,
                                            Text(
                                              "Add to Cart",
                                              style: GoogleFonts.heebo(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.normal,
                                                color: const Color(0xff181C2E),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        )
      ],
    );
  }
}
