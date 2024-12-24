import 'package:app_shop_ease/core/utils/app_color.dart';
import 'package:app_shop_ease/featuers/customer/presentation/screens/cart_screen.dart';
import 'package:app_shop_ease/featuers/customer/presentation/screens/favourite_screen.dart';
import 'package:app_shop_ease/featuers/customer/presentation/screens/home_screen.dart';
import 'package:app_shop_ease/featuers/customer/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppInitScreen extends StatefulWidget {
  static const String routeName = 'InitApp';
  const AppInitScreen({super.key});

  @override
  State<AppInitScreen> createState() => _AppInitScreenState();
}

class _AppInitScreenState extends State<AppInitScreen> {
  List<Widget> widgetList = [
    HomeScreen(),
    CartScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 13.sp,
        selectedFontSize: 14.sp,
        currentIndex: index,
        onTap: (selectedIndex) {
          index = selectedIndex;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/icon-home.svg',
              height: 23.h,
              width: 23.w,
              fit: BoxFit.cover,
              color: index == 0
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).hintColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/icon-cart.svg',
              height: 23.h,
              width: 23.w,
              fit: BoxFit.cover,
              color: index == 1
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).hintColor,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/icon-favourite.svg',
              height: 23.h,
              width: 23.w,
              fit: BoxFit.cover,
              color: index == 2
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).hintColor,
            ),
            label: ' Favorite',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/icon-account.svg',
              height: 23.h,
              width: 23.w,
              fit: BoxFit.cover,
              color: index == 3
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).hintColor,
            ),
            label: 'Account',
          ),
        ],
      ),
      body: widgetList[index],
    );
  }
}
