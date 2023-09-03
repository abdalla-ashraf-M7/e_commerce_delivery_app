import 'package:delivery_e_commerce/core/constants/colors.dart';
import 'package:delivery_e_commerce/view/widgets/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/forgetpasswordcontrollers/successressetpasswordcontroller.dart';

class ScuccessRessetPasswordScreen extends StatelessWidget {
  const ScuccessRessetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessRessetPasswordControllerImp controller = Get.put(SuccessRessetPasswordControllerImp());
    return Scaffold(
      backgroundColor: Appcolors.white,
      appBar: AppBar(
        backgroundColor: Appcolors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "50".tr,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Appcolors.grey2, fontSize: 25),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Icon(
              Icons.check_circle_outline,
              size: 200,
              color: Appcolors.primarycolor,
            ),
            Text(
              "33".tr,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 30),
            Text(
              "51".tr,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const Spacer(
              flex: 1,
            ),
            CustomButtonAuth(
              text: "26".tr,
              tap: () {
                controller.gotologin();
              },
            ),
            const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
