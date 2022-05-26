import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:some_application/app/shared/size_config.dart';
import 'package:some_application/app/shared/theme.dart';
import 'package:some_application/base/base_bloc.dart';

class IndexProvider extends BaseBloc {
  int bottomIndex = 0;
  final controller = ScrollController();
  List<BottomNavigationBarItem>? items;

  init(BuildContext context) {
    setLoading(true);
    SizeConfig().init(context);
    setItems();
    setLoading(false);
  }

  setItems() {
    items = [
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          AppSvgImages.homeIcon,
          // color: AppColors.systemGreenColor,
          width: getProportionateScreenHeight(18),
          height: getProportionateScreenHeight(20),
        ),
        activeIcon: SvgPicture.asset(
          AppSvgImages.homeActiveIcon,
          width: getProportionateScreenHeight(18),
          height: getProportionateScreenHeight(20),
          color: AppColors.primaryColor,
        ),
        label: 'Главная',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          AppSvgImages.paymentsInactiveIcon,
          // color: AppColors.systemGrayColor,
          width: getProportionateScreenHeight(18),
          height: getProportionateScreenHeight(20),
        ),
        activeIcon: SvgPicture.asset(
          AppSvgImages.paymentsInactiveIcon,
          width: getProportionateScreenHeight(18),
          height: getProportionateScreenHeight(20),
          color: AppColors.primaryColor,
        ),
        label: 'Покупки',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          AppSvgImages.addReceiptIcon,
          color: AppColors.primaryColor,
          width: getProportionateScreenHeight(40),
          height: getProportionateScreenHeight(40),
        ),
        activeIcon: SvgPicture.asset(
          AppSvgImages.addReceiptIcon,
          width: getProportionateScreenHeight(40),
          height: getProportionateScreenHeight(40),
          color: AppColors.primaryColor,
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          AppSvgImages.receiptIcon,
          width: getProportionateScreenHeight(18),
          height: getProportionateScreenHeight(20),
        ),
        activeIcon: SvgPicture.asset(
          AppSvgImages.receiptIcon,
          width: getProportionateScreenHeight(18),
          height: getProportionateScreenHeight(20),
          color: AppColors.primaryColor,
        ),
        label: 'Рецепты',
      ),
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          AppSvgImages.profileIcon,
          // color: AppColors.systemDarkGrayColor,
          width: getProportionateScreenHeight(18),
          height: getProportionateScreenHeight(20),
        ),
        activeIcon: SvgPicture.asset(
          AppSvgImages.profileIcon,
          width: getProportionateScreenHeight(18),
          height: getProportionateScreenHeight(20),
          color: AppColors.primaryColor,
        ),
        label: 'Профиль',
      ),
    ];
    notifyListeners();
  }

  bool isFirst = true;
  setBottomIndex(int index, context) {
    bottomIndex = index;
    log('Bottom index: $bottomIndex');
    // if (bottomIndex != 0) {
    //   isFirst ? Navigator.pop(context) : null;
    // }
    bottomIndex != 0 ? isFirst = false : isFirst = true;

    notifyListeners();
  }
}
