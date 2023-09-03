import 'package:delivery_e_commerce/core/constants/approutes.dart';
import 'package:delivery_e_commerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware {
  MyServices myServices = Get.find();
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPrefs!.getString("step") == "2") {
      return const RouteSettings(name: Approutes.homescreen);
    }
  }
}
