import 'package:delivery_e_commerce/core/constants/approutes.dart';
import 'package:delivery_e_commerce/core/services/services.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  initialdata();
  gotonotifications();
}

class HomeControllerImp extends HomeController {
  String? id;
  String? username;
  MyServices myServices = Get.find();

  @override
  initialdata() {
    id = myServices.sharedPrefs!.getString("id");
    username = myServices.sharedPrefs!.getString("username");
  }

  @override
  void onInit() {
    initialdata();
    super.onInit();
  }

  @override
  gotonotifications() {
    Get.toNamed(Approutes.notifications);
  }
}
