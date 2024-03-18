import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/assets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens = [
    Container(
      color: Colors.white,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.purple,
    ),
    Container(
      color: Colors.orange,
    ),
  ];

  int currentScreen = 0;

  void _changeScreen(int index) {
    setState(() {
      currentScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentScreen],
      bottomNavigationBar: Container(
        height: 80.h,
        color: Color(0xffF2F4F7),
        child: Padding(
          padding: EdgeInsets.only(bottom: 20.h, top: 1.h),
          child: Container(
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _bottomItem(
                  title: "itemBottomBarMain".tr(),
                  icon: Assets.tLogoIcon,
                  isActive: currentScreen == 0,
                  onTap: () {
                    _changeScreen(0);
                  },
                ),
                _bottomItem(
                  title: "itemBottomBarCatalog".tr(),
                  icon: Assets.tCatalog,
                  isActive: currentScreen == 1,
                  onTap: () {
                    _changeScreen(1);
                  },
                ),
                _bottomItem(
                  title: "itemBottomBarShop".tr(),
                  icon: Assets.tShop,
                  isActive: currentScreen == 2,
                  onTap: () {
                    _changeScreen(2);
                  },
                ),
                _bottomItem(
                  title: "itemBottomBarFavorite".tr(),
                  icon: Assets.tFavorite,
                  isActive: currentScreen == 3,
                  onTap: () {
                    _changeScreen(3);
                  },
                ),
                _bottomItem(
                  title: "itemBottomBarProfile".tr(),
                  icon: Assets.tProfile,
                  isActive: currentScreen == 4,
                  onTap: () {
                    _changeScreen(4);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _bottomItem({
  required String title,
  required String icon,
  required bool isActive,
  required Function() onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 27.30,
          width: 27.30,
          child: SvgPicture.asset(
            icon,
            colorFilter: isActive
                ? ColorFilter.mode(Color(0xff7000FF), BlendMode.srcIn)
                : ColorFilter.mode(Color(0xff8B8E99), BlendMode.srcIn),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 10.50,
            fontWeight: FontWeight.w500,
            color: isActive ? Color(0xff7000FF) : Color(0xff8B8E99),
          ),
        ),
      ],
    ),
  );
}
