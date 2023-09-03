import 'package:delivery_e_commerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/imageassets.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset(
            Appimageassets.dots,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  myServices.sharedPrefs!.setString("step", "1");
                  print(myServices.sharedPrefs!.getString("step"));
                },
                child: Text(
                  "1".tr,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              /* CustomButtonLanguage(
                  text: "2".tr,
                  press: () {
                    controller.changeLang("en");
                    Get.toNamed(Approutes.onboarding);
                  }), */
              const SizedBox(
                height: 30,
              ),
              /*  CustomButtonLanguage(
                  text: "3".tr,
                  press: () {
                    controller.changeLang("ar");
                   // Get.toNamed(Approutes.onboarding);
                  }), */
            ],
          ),
        ],
      )),
    );
  }
}
