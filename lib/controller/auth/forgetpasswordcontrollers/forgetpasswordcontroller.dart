import 'package:delivery_e_commerce/core/class/requeststatus.dart';
import 'package:delivery_e_commerce/core/functions/handlingdata.dart';
import 'package:delivery_e_commerce/core/shared/defaultdialog.dart';
import 'package:delivery_e_commerce/data/datasourse/remote/auth/forgetpassword/forgetpassworddata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  gotoverifycode();
  initialData();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState>? forgetpasswordformstate;
  TextEditingController? email;

  ForgetPasswordData forgetPasswordData = ForgetPasswordData(Get.find());
  requeststatus requeststate = requeststatus.success;

  @override
  initialData() {
    forgetpasswordformstate = GlobalKey();
    email = TextEditingController();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  gotoverifycode() async {
    if (forgetpasswordformstate!.currentState!.validate()) {
      requeststate = requeststatus.loading;
      update();
      var response = await forgetPasswordData.getData(email!.text);
      print("555555555555555555555555555555$response");

      requeststate = handlingData(response);
      if (requeststate == requeststatus.success) {
        if (response["status"] == "success") {
          //Get.offNamed(Approutes.verifycode, arguments: {"email": email!.text});
        } else {
          defultDialog("Warning!!", "Email Not Found", "Cancle", "Try Again", 60, 10, () {
            // Get.offAllNamed(Approutes.login);
          }, () {
            Get.back();
          });

          requeststate = requeststatus.failaur;
        }
      }
    }
    update();
  }

  @override
  void dispose() {
    email!.dispose();
    super.dispose();
  }
}
