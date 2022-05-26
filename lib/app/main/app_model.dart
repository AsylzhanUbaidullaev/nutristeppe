import 'dart:async';
import 'dart:developer';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:some_application/base/base_bloc.dart';
import 'package:some_application/pages/index/index.dart';

class MyAppModel extends BaseBloc {
  StreamController<ConnectivityResult> connectionStatusController =
      StreamController<ConnectivityResult>();

  init() async {
    log('init called');
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      log('Internet result is: $result');
      connectionStatusController.add(result);
    });
  }

  Widget getHomeScreen() {
    return const IndexPage();
  }
}
