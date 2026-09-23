import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub_app/core/utils/app_images.dart';

// Model to hold the SVG paths and titles for each item
class NavItem {
  final String title;
  final String activeSvg;
  final String inactiveSvg;

  NavItem({
    required this.title,
    required this.activeSvg,
    required this.inactiveSvg,
  });
}

class CustomBottomNavBar extends StatefulWidget {
  // If you are managing state with Cubit, you can pass the currentIndex
  // and an onTabTapped callback through the constructor instead of using local state.
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  final List<NavItem> _items = [
    NavItem(
      title: 'الرئيسية',
      activeSvg: Assets.imagesVuesaxBoldHome,
      inactiveSvg: Assets.imagesVuesaxOutlineHome,
    ),
    NavItem(
      title: 'المنتجات', // Grid icon
      activeSvg: Assets.imagesVuesaxBoldProducts,
      inactiveSvg: Assets.imagesVuesaxOutlineProducts,
    ),
    NavItem(
      title: 'السلة', // Cart icon
      activeSvg: Assets.imagesVuesaxBoldShoppingCart,
      inactiveSvg: Assets.imagesVuesaxOutlineShoppingCart,
    ),
    NavItem(
      title: 'حسابي', // User icon
      activeSvg: Assets.imagesVuesaxBoldUser,
      inactiveSvg: Assets.imagesVuesaxOutlineUser,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(_items.length, (index) {
            return _buildNavItem(index, _items[index]);
          }),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, NavItem item) {
    final bool isActive = _selectedIndex == index;
    // Dark green color matched from the image's active state
    final Color activeColor = const Color(0xFF115935);

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutQuint,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? activeColor : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              isActive ? item.activeSvg : item.inactiveSvg,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                isActive ? Colors.white : Colors.grey.shade600,
                BlendMode.srcIn,
              ),
            ),
            // The active state displays the text alongside the icon[cite: 1]
            if (isActive) ...[
              const SizedBox(width: 8),
              Text(
                item.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cairo',
                  fontSize: 14,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
