import 'exports.dart';

class BuildAppBarContent extends StatelessWidget {
  const BuildAppBarContent({
    super.key,
    required Color primaryColor,
  }) : _primaryColor = primaryColor;

  final Color _primaryColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome",
                style: GoogleFonts.poppins(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w300,
                  color: _primaryColor,
                ),
              ),
              Text(
                "Mr. Alwan",
                style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: _primaryColor,
                ),
              )
            ],
          ),
          Row(
            children: [
              Badge(
                backgroundColor: Colors.green,
                offset: const Offset(-3, 1),
                label: Text(
                  "2",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                child: CircleAvatar(
                  radius: 20.r,
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    Icons.add_shopping_cart_outlined,
                    color: _primaryColor,
                  ),
                ),
              ),
              Badge(
                backgroundColor: Colors.green,
                offset: const Offset(-7, 1),
                label: Text(
                  "2",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                child: CircleAvatar(
                  radius: 20.r,
                  backgroundColor: Colors.transparent,
                  child: Icon(
                    Icons.notifications_none_outlined,
                    color: _primaryColor,
                  ),
                ),
              ),
              // user profile
              CircleAvatar(
                radius: 19.r,
                backgroundColor: Colors.transparent,
                backgroundImage: const AssetImage(
                  'assets/images/user_placeholder.jpeg',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
