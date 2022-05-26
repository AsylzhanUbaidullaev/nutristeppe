import 'package:flutter/material.dart';
import 'package:some_application/app/shared/theme.dart';
import 'package:some_application/base/base_bloc.dart';

class ReceiptsProvider extends BaseBloc {
  TextEditingController searchController = TextEditingController();

  List<String> breakfastImages = [
    AppPngPaths.breakfast1,
    AppPngPaths.breakfast2,
    AppPngPaths.breakfast3,
  ];

  List<String> dinnerImages = [
    AppPngPaths.dinner1,
    AppPngPaths.dinner2,
    AppPngPaths.dinner3,
  ];
}
