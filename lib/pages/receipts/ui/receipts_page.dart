import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:some_application/app/shared/size_config.dart';
import 'package:some_application/app/shared/theme.dart';
import 'package:some_application/app/shared/ui_helper.dart';
import 'package:some_application/base/base_provider.dart';
import 'package:some_application/pages/receipts/provider/receipts_provider.dart';
import 'package:some_application/widgets/default_text.dart';
import 'package:some_application/widgets/loading_view.dart';

class ReceiptsPage extends StatelessWidget {
  const ReceiptsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<ReceiptsProvider>(
      model: ReceiptsProvider(),
      builder: (context, model, child) {
        return model.isLoading
            ? const LoadingView()
            : Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(
                    getProportionateScreenHeight(100),
                  ),
                  child: AppBar(
                    title: DefaultText(
                      text: 'Рецепты',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    centerTitle: true,
                    backgroundColor: AppColors.whiteColor,
                    elevation: 0,
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(
                        getProportionateScreenHeight(80),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(10),
                        ),
                        child: ListTile(
                          title: TextFormField(
                            controller: model.searchController,
                            cursorColor: AppColors.systemBlackColor,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: AppColors.systemBlackColor,
                                fontWeight: FontWeight.w500,
                                fontSize: getProportionateScreenHeight(14),
                              ),
                            ),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: getProportionateScreenWidth(10),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.systemDarkGrayColor,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: AppColors.systemDarkGrayColor,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              hintText: "Найти блюдо",
                              hintStyle: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: getProportionateScreenHeight(15),
                                ),
                              ),
                              prefixIcon: const Icon(
                                CupertinoIcons.search,
                                color: AppColors.systemDarkGrayColor,
                              ),
                            ),
                          ),
                          trailing: GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(15),
                                vertical: getProportionateScreenHeight(15),
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.systemGrayColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: SvgPicture.asset(
                                AppSvgImages.settings,
                                // color: AppColors.whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(10),
                      vertical: getProportionateScreenHeight(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _divider(),
                        Column(
                          children: [
                            Row(
                              children: [
                                customContainer(1, 'Салат', AppColors.bgSalat,
                                    AppPngPaths.salad),
                                UIHelper.horizontalSpace(12),
                                customContainer(2, 'Основные блюда',
                                    AppColors.bgDish, AppPngPaths.mainDish),
                              ],
                            ),
                            UIHelper.verticalSpace(
                                getProportionateScreenHeight(12)),
                            Row(
                              children: [
                                customContainer(2, 'Супы', AppColors.bgSoup,
                                    AppPngPaths.soup),
                                UIHelper.horizontalSpace(12),
                                customContainer(1, 'Выпечка и десерты',
                                    AppColors.bgPastries, AppPngPaths.dessert),
                              ],
                            ),
                            UIHelper.verticalSpace(
                                getProportionateScreenHeight(12)),
                            Row(
                              children: [
                                customContainer(
                                    1,
                                    'Гарниры',
                                    AppColors.bgSideDishes,
                                    AppPngPaths.sideDish),
                                UIHelper.horizontalSpace(12),
                                customContainer(1, 'Закуски',
                                    AppColors.bgSnacks, AppPngPaths.snack),
                              ],
                            ),
                          ],
                        ),
                        _divider(),
                        UIHelper.verticalSpace(
                          getProportionateScreenHeight(10),
                        ),
                        const Text(
                          'Рецепты дня',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        UIHelper.verticalSpace(
                          getProportionateScreenHeight(10),
                        ),
                        SizedBox(
                          height: 300,
                          width: double.maxFinite,
                          child: ListView.separated(
                            // padding: EdgeInsets.all(0),
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),

                            // physics: const Bo(),
                            shrinkWrap: true,
                            itemCount: 3,
                            separatorBuilder: (context, int index) {
                              return SizedBox(
                                width: getProportionateScreenWidth(20),
                              );
                            },
                            itemBuilder: (context, int index) {
                              return Container(
                                width: 300,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: const DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(AppPngPaths.meatPhoto),
                                  ),
                                ),
                                child: Container(
                                    alignment: Alignment.bottomLeft,
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                          getProportionateScreenWidth(10),
                                      vertical:
                                          getProportionateScreenHeight(10),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      gradient: const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Colors.transparent,
                                          // Colors.transparent,
                                          Colors.transparent,
                                          // Colors.black.withOpacity(0.8)
                                          Colors.black,
                                        ],
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Говядина средней жирности \nприготовленная',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        UIHelper.verticalSpace(
                                          getProportionateScreenHeight(10),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SvgPicture.asset(
                                              AppSvgImages.healthIndex,
                                            ),
                                            SvgPicture.asset(
                                              AppSvgImages.trafficLight,
                                            ),
                                            SvgPicture.asset(
                                              AppSvgImages.fireIcon,
                                            ),
                                            const Text(
                                              '193 ккал',
                                              style: TextStyle(
                                                  color: AppColors.whiteColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SvgPicture.asset(
                                              AppSvgImages.clockIcon,
                                            ),
                                            const Text(
                                              '15 мин',
                                              style: TextStyle(
                                                  color: AppColors.whiteColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        )
                                      ],
                                    )),
                              );
                            },
                          ),
                        ),
                        _divider(),
                        Row(
                          children: const [
                            Text(
                              'Завтраки 🥞',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Spacer(),
                            Text(
                              'См. все',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                        UIHelper.verticalSpace(20),
                        ListView.separated(
                          itemCount: model.breakfastImages.length,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          separatorBuilder: (context, int index) {
                            return _divider();
                          },
                          itemBuilder: (context, int index) {
                            return SizedBox(
                              height: 120,
                              width: double.maxFinite,
                              child: Row(
                                children: [
                                  ClipRRect(
                                    child: Image.asset(
                                      model.breakfastImages[index],
                                    ),
                                  ),
                                  UIHelper.horizontalSpace(
                                    getProportionateScreenWidth(15),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Кофе растворимый без кофеина готовый',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              AppSvgImages.healthIndexGreen,
                                            ),
                                            UIHelper.horizontalSpace(15),
                                            SvgPicture.asset(
                                              AppSvgImages.trafficLight,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              AppSvgImages.fireIcon,
                                            ),
                                            const Text(
                                              '190 ккал',
                                              style: TextStyle(
                                                color: AppColors.primaryColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        UIHelper.verticalSpace(25),
                        Row(
                          children: const [
                            Text(
                              'Обед 🥞',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Spacer(),
                            Text(
                              'См. все',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                        UIHelper.verticalSpace(20),
                        ListView.separated(
                          itemCount: model.dinnerImages.length,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          separatorBuilder: (context, int index) {
                            return _divider();
                          },
                          itemBuilder: (context, int index) {
                            return SizedBox(
                              height: 120,
                              width: double.maxFinite,
                              child: Row(
                                children: [
                                  ClipRRect(
                                    child: Image.asset(
                                      model.dinnerImages[index],
                                      // height: 100,
                                      // width: 100,
                                    ),
                                  ),
                                  UIHelper.horizontalSpace(
                                    getProportionateScreenWidth(15),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Кофе растворимый без кофеина готовый',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              AppSvgImages.healthIndexGreen,
                                            ),
                                            UIHelper.horizontalSpace(15),
                                            SvgPicture.asset(
                                              AppSvgImages.trafficLight,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              AppSvgImages.fireIcon,
                                            ),
                                            const Text(
                                              '190 ккал',
                                              style: TextStyle(
                                                color: AppColors.primaryColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }

  Expanded customContainer(
      int flex, String title, Color bgColor, String image) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(10),
          vertical: getProportionateScreenHeight(10),
        ),
        height: 112,
        // width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(fit: BoxFit.contain, image: AssetImage(image)),
        ),
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  _divider() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(13),
      ),
      child: const Divider(
        color: AppColors.systemDarkGrayColor,
      ),
    );
  }
}
