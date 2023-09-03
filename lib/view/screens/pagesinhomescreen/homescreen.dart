import 'package:delivery_e_commerce/controller/home/homescreencontroller.dart';
import 'package:delivery_e_commerce/core/functions/exitalert.dart';
import 'package:delivery_e_commerce/view/widgets/homewidgets/custombottombar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HOmeScreenControllerImp());
    return GetBuilder<HOmeScreenControllerImp>(
        builder: (controller) => Scaffold(
              bottomNavigationBar: const CustomBottomBarHome(),
              body: WillPopScope(
                  child: controller.pagesinhome[controller.currentpage],
                  onWillPop: () {
                    return exitAlert();
                  }),
            ));
  }
}
