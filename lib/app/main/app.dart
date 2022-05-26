import 'package:flutter/material.dart';
import 'package:some_application/app/main/app_model.dart';
import 'package:some_application/app/main/navigator_state.dart';
import 'package:some_application/app/shared/theme.dart';
import 'package:some_application/base/base_provider.dart';

class MyApp extends StatelessWidget {
  final MyAppModel model;

  const MyApp({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<MyAppModel>(
      model: model,
      builder: (context, model, child) {
        return StreamBuilder<Object>(
          stream: model.connectionStatusController.stream,
          builder: (context, snapshot) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Kettik',
              navigatorKey: GlobalVariable.navState,
              theme: ThemeData(
                primaryColor: AppColors.primaryColor,
                bottomSheetTheme: BottomSheetThemeData(
                  backgroundColor: AppColors.primaryColor.withOpacity(0),
                ),
                fontFamily: 'Manrope',
              ),
              home: model.getHomeScreen(),
            );
          },
        );
      },
    );
  }
}
