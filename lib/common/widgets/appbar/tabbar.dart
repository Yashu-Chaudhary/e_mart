import 'package:e_mart/utils/constants/color.dart';
import 'package:e_mart/utils/device/device_utility.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class PTabBar extends StatelessWidget implements PreferredSizeWidget {
  const PTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = PHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? PColors.black : PColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: PColors.primary,
        labelColor: dark ? PColors.white : PColors.primary,
        unselectedLabelColor: PColors.darkGrey,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(PDeviceUtils.getAppBarHeight());
}
