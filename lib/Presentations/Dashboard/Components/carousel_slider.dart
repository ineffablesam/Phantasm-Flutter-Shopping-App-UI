import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'exports.dart';

class BuildCarousel extends StatefulWidget {
  const BuildCarousel({super.key});

  @override
  State<BuildCarousel> createState() => _BuildCarouselState();
}

class _BuildCarouselState extends State<BuildCarousel> {
  late CarouselController carouselController;
  int _activeCarouselIndex = 0;
  @override
  void initState() {
    carouselController = CarouselController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const _primaryColor = Color(0xff0A3E89);
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    _activeCarouselIndex = index;
                  });
                },
                height: 100.h,
                aspectRatio: 16 / 1,
                viewportFraction: 0.8,
                enlargeCenterPage: true,
                enlargeFactor: 0.2,
                autoPlay: true,
              ),
              items: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.asset(
                    "assets/images/c_image_1.png",
                    fit: BoxFit.cover,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.asset(
                    "assets/images/c_image_2.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Material(
                    elevation: 15,
                    shape: const CircleBorder(),
                    child: CustomTap(
                      onTap: () {
                        carouselController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear);
                      },
                      child: CircleAvatar(
                        radius: 20.r,
                        backgroundColor: Colors.grey.shade100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              size: 16.sp,
                              color: _primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Material(
                    elevation: 15,
                    shape: const CircleBorder(),
                    child: CustomTap(
                      onTap: () {
                        carouselController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear);
                      },
                      child: CircleAvatar(
                        radius: 20.r,
                        backgroundColor: Colors.grey.shade100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.sp,
                              color: _primaryColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        20.verticalSpace,
        AnimatedSmoothIndicator(
          activeIndex: _activeCarouselIndex,
          count: 2,
          effect: WormEffect(
            dotHeight: 8.h,
            dotWidth: 8.w,
            dotColor: Colors.grey.shade300,
            activeDotColor: _primaryColor,
          ),
        ),
      ],
    );
  }
}
