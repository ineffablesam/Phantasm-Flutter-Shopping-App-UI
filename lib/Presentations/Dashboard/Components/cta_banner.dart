import 'package:flutter/cupertino.dart';

import '../../ProductsPage/products_page.dart';
import 'exports.dart';

class BuildCtaBanner extends StatelessWidget {
  const BuildCtaBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.h),
      child: CustomTap(
        onTap: () {
          Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => const ProductPage(),
              ));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: Image.asset(
            "assets/images/cta_banner.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
