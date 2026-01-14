import 'package:ecommerce_clothing/core/assets_gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      margin: EdgeInsets.only(bottom: 16.r, left: 16.r, right: 16.r),
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: ColorName.charcoalDark,
        borderRadius: BorderRadius.all(Radius.circular(50.r)),
      ),
      child: BottomNavigationBar(
        useLegacyColorScheme: false,
        elevation: 0,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.shade400,
        selectedFontSize: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: _CustomBottomNavigationBarIcon(
              selectedIndex: _selectedIndex == 0,
              icon: LucideIcons.house,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _CustomBottomNavigationBarIcon(
              selectedIndex: _selectedIndex == 1,
              icon: LucideIcons.shoppingBag,
              showBadge: true,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _CustomBottomNavigationBarIcon(
              selectedIndex: _selectedIndex == 2,
              icon: LucideIcons.heart,
            ),
            label: '',
          ),

          BottomNavigationBarItem(
            icon: _CustomBottomNavigationBarIcon(
              selectedIndex: _selectedIndex == 3,
              icon: LucideIcons.user,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}

class _CustomBottomNavigationBarIcon extends StatelessWidget {
  final bool selectedIndex;
  final IconData icon;
  final bool showBadge;

  const _CustomBottomNavigationBarIcon({
    required this.selectedIndex,
    required this.icon,
    this.showBadge = false,
  });

  @override
  Widget build(BuildContext context) {
    bool selectedIndex = this.selectedIndex;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withValues(alpha: 0.1),
      ),
      child: Column(
        children: [
          Badge(
            backgroundColor: Colors.redAccent,
            smallSize: showBadge ? 10.w : 0.w,
            child: Icon(
              icon,
              size: 27.h,
              color: selectedIndex ? Colors.white : Colors.grey.shade400,
            ),
          ),
          Visibility(
            visible: selectedIndex,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 6.h,
              width: 6.h,
              margin: EdgeInsets.only(top: 4.h),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
