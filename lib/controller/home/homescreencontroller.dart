import 'package:delivery_e_commerce/core/constants/approutes.dart';
import 'package:delivery_e_commerce/view/screens/orders/accepted.dart';
import 'package:delivery_e_commerce/view/screens/orders/pendings.dart';
import 'package:delivery_e_commerce/view/screens/pagesinhomescreen/settingscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changepage(int i);
  gotocart();
}

class HOmeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;
  List<Widget> pagesinhome = [
    const PendingsScreen(),
    AcceptdScreen(),
    const SettingsScreen(),
  ];
  List titlepagesinhome = [
    ["Pendings", "Aceppted", "Settings"],
    [Icons.watch_later_outlined, Icons.thumb_up, Icons.settings]
  ];

  @override
  changepage(int i) {
    currentpage = i;
    update();
  }

  @override
  gotocart() {
    Get.toNamed(Approutes.cart);
  }
}
