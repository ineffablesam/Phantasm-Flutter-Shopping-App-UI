import 'exports.dart';

class BuildBrandLogos extends StatefulWidget {
  const BuildBrandLogos({
    super.key,
  });

  @override
  State<BuildBrandLogos> createState() => _BuildBrandLogosState();
}

class _BuildBrandLogosState extends State<BuildBrandLogos> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
      ),
      decoration: const BoxDecoration(
        color: Color(
          0xffFFF9F9,
        ),
      ),
      child: Column(
        children: [
          Text(
            "Our Brands",
            style: GoogleFonts.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xff0A3E89),
            ),
          ),
          ListView.builder(
              itemCount: 3,
              shrinkWrap: true,
              clipBehavior: Clip.none,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, im) {
                brandData.shuffle();
                return Container(
                  height: 60.h,
                  child: ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    clipBehavior: Clip.none,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      final brandIndex = i % brandData.length;
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: i == 0 ? 20.w : 0,
                              right: i == brandData.length - 1 ? 16.w : 10.w,
                            ),
                            height: 45.h,
                            width: 100.h,
                            padding: EdgeInsets.all(5.w),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50.r),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color(0xffCEB87E).withOpacity(0.6),
                                  spreadRadius: 1,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Image.asset(
                              brandData[brandIndex].image,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }
}
