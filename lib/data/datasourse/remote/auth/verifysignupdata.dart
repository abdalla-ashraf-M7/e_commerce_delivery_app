import 'package:delivery_e_commerce/core/class/curd.dart';
import 'package:delivery_e_commerce/core/constants/applinks.dart';

class VerifySignupData {
  Crud crud = Crud();
  VerifySignupData(this.crud);

  getData(String email, String verifycode) async {
    var response = await crud.postData(AppLinks.verifysignup, {
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
