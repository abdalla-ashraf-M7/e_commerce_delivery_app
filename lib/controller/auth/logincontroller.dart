import 'package:delivery_e_commerce/core/class/requeststatus.dart';
import 'package:delivery_e_commerce/core/constants/approutes.dart';
import 'package:delivery_e_commerce/core/functions/handlingdata.dart';
import 'package:delivery_e_commerce/core/functions/saveuserdata.dart';
import 'package:delivery_e_commerce/core/services/services.dart';
import 'package:delivery_e_commerce/core/shared/defaultdialog.dart';
import 'package:delivery_e_commerce/data/datasourse/remote/auth/logindata.dart';
import 'package:delivery_e_commerce/view/screens/pagesinhomescreen/homescreen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LogInController extends GetxController {
  login();
  gotoforgetpassword();
  hidepassword();
  initialData();
}

class LogInControllerImp extends LogInController {
  GlobalKey<FormState>? loginformstate;
  TextEditingController? email;
  TextEditingController? password;
  bool ispasswordhidden = true;
  MyServices myServices = Get.find();
  LoginData loginData = LoginData(Get.find());
  requeststatus reqeuststate = requeststatus.success;

  @override
  initialData() {
    FirebaseMessaging.instance.getToken().then((value) {
      print("********$value");
    });
    loginformstate = GlobalKey();
    email = TextEditingController();
    password = TextEditingController();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  hidepassword() {
    if (ispasswordhidden == false) {
      ispasswordhidden = true;
    } else {
      ispasswordhidden = false;
    }
    update();
  }

  @override
  gotoforgetpassword() {
    Get.toNamed(Approutes.forgetpassword);
  }

  @override
  login() async {
    if (loginformstate!.currentState!.validate()) {
      reqeuststate = requeststatus.loading;
      update();
      var response = await loginData.getData(email!.text, password!.text);
      print("222222222222inlogin22222222222222$response");
      reqeuststate = handlingData(response);
      if (reqeuststate == requeststatus.success) {
        if (response["status"] == "success") {
          try {
            saveUserData(
              response['data']['delivery_id'],
              response['data']['delivery_name'],
              response['data']['delivery_email'],
              response['data']['delivery_password'],
              response['data']['delivery_phone'],
            );
            String id = "${myServices.sharedPrefs!.getString("id")}";
            FirebaseMessaging.instance.subscribeToTopic("delivery");
            FirebaseMessaging.instance.subscribeToTopic("delivery$id");
            print("********************");
            Get.offAll(HomeScreen());
          } catch (e) {
            print("(???????????????????????????????$e)");
            defultDialog("Warning!!", "save user data error sorry try later", "Cancle", "try again", 60, 10, () {
              Get.offAllNamed(Approutes.login);
            }, () {
              Get.back();
            });
            update();
          }
        } else if (response["message"] == "xapprove") {
          reqeuststate = requeststatus.xapprove;
          defultDialog("Warning!!", "You need to verify your email first press verify and check your email we have sent you verification code", "Cancle", "Verify", 60, 10, () {
            Get.offAllNamed(Approutes.login);
          }, () {
            //  Get.toNamed(Approutes.verifyemailsignup, arguments: {"email": email!.text});
          });
          update();
        } else if (response["message"] == "xwrong") {
          reqeuststate = requeststatus.failaur;
          defultDialog("Warning!!", "Email or passowrd is not correct", "Cancle", "Try Again", 60, 10, () {
            Get.offAllNamed(Approutes.login);
          }, () {
            Get.back();
          });
          update();
        } else {
          reqeuststate == requeststatus.unknown2;
        }
      } else if (reqeuststate == requeststatus.unknown) {
        defultDialog("Warning!!", "Sorry it is unkown error try later", "Cancle", "Try Again", 60, 10, () {
          Get.offAllNamed(Approutes.login);
        }, () {
          Get.back();
        });
        update();
      }
      print("@@@@@@@@@@@@@@@inlogin@@@@@@@@@@@@@@@@ $reqeuststate");
      //update();
    }
  }

  @override
  void dispose() {
    email!.dispose();
    password!.dispose();
    super.dispose();
  }
}
