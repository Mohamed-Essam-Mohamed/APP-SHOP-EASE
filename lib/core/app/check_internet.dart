import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class CheckInternet {
  static ValueNotifier<bool> isConnected = ValueNotifier<bool>(true);
  void init() {
    (Connectivity().onConnectivityChanged.listen(getStatusInternet));
  }

  void getStatusInternet(List<ConnectivityResult> result) {
    if (result.contains(ConnectivityResult.wifi) ||
        result.contains(ConnectivityResult.mobile)) {
      isConnected.value = true;
    } else {
      isConnected.value = false;
    }
  }
}
