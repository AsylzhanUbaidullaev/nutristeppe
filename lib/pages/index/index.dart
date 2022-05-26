import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:some_application/app/shared/size_config.dart';
import 'package:some_application/app/shared/theme.dart';
import 'package:some_application/base/base_provider.dart';
import 'package:some_application/pages/add_receipt/ui/add_receipt_page.dart';
import 'package:some_application/pages/home/ui/home.dart';
import 'package:some_application/pages/index/index_provider.dart';
import 'package:some_application/pages/profile/ui/profile_page.dart';
import 'package:some_application/pages/purchases/ui/purchases_page.dart';
import 'package:some_application/pages/receipts/ui/receipts_page.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<IndexProvider>(
      onReady: (p0) => p0.init(context),
      model: IndexProvider(),
      builder: (context, model, child) {
        return Scaffold(
          body: _body[model.bottomIndex],
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {},
          //   backgroundColor: null,
          //   focusColor: null,
          //   hoverColor: null,
          //   disabledElevation: 0,
          //   child: SvgPicture.asset(AppSvgImages.addReceiptIcon),
          // ),
          // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: AppColors.primaryColor,
            selectedFontSize: getProportionateScreenHeight(16),
            unselectedFontSize: getProportionateScreenWidth(14),
            unselectedItemColor: AppColors.systemBlackColor,
            showUnselectedLabels: true,
            currentIndex: model.bottomIndex,
            items: model.items!,
            onTap: (index) => model.setBottomIndex(index, context),
          ),
        );
      },
    );
  }
}

var _body = [
  const HomePage(),
  const PurchasesPage(),
  const AddReceiptPage(),
  const ReceiptsPage(),
  const ProfilePage(),
];
