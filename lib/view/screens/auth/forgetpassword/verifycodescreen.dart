import 'package:delivery_e_commerce/core/class/handlingdatview.dart';
import 'package:delivery_e_commerce/core/constants/colors.dart';
import 'package:delivery_e_commerce/core/constants/imageassets.dart';
import 'package:delivery_e_commerce/view/widgets/auth/custombodyauth.dart';
import 'package:delivery_e_commerce/view/widgets/auth/customrowsignupauth.dart';
import 'package:delivery_e_commerce/view/widgets/auth/customtitleauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/forgetpasswordcontrollers/verifycodecontroller.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeControllerImp());
    return Scaffold(
        backgroundColor: Appcolors.white,
        appBar: AppBar(
          backgroundColor: Appcolors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "41".tr,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Appcolors.grey2),
          ),
        ),
        body: GetBuilder<VerifyCodeControllerImp>(
            builder: (controller) => HandlinDataRequest(
                  requeststat: controller.requeststate,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    width: double.infinity,
                    child: ListView(
                      children: [
                        const SizedBox(height: 30),
                        Image.asset(
                          Appimageassets.newlogo,
                          height: 100,
                        ),
                        const SizedBox(height: 30),
                        CustomTitleAuth(title: "42".tr),
                        const SizedBox(height: 20),
                        CustomBodyAuth(body: "43".tr),
                        const SizedBox(height: 30),
                        OtpTextField(
                          fieldWidth: 55,
                          borderRadius: BorderRadius.circular(20),
                          numberOfFields: 5,
                          borderColor: const Color(0xFF512DA8),
                          //set to true to show as box or false to show as dash
                          showFieldAsBox: true,
                          //runs when a code is typed in
                          onCodeChanged: (String code) {
                            //handle validation or checks here
                            print("************$code");
                          },
                          //runs when every textfield is filled
                          onSubmit: (String verificationCode) {
                            controller.gotoressetpassword(verificationCode);
                          }, // end onSubmit
                        ),
                        const SizedBox(height: 30),
                        CustomRowSignAuth(text1: "30".tr, text2: "31".tr, tap: () {})
                      ],
                    ),
                  ),
                )));
  }
}
