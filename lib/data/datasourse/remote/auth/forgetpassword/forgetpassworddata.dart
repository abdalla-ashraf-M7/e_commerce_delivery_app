import 'package:delivery_e_commerce/core/class/curd.dart';
import 'package:delivery_e_commerce/core/constants/applinks.dart';

class ForgetPasswordData {
  Crud crud = Crud();
  ForgetPasswordData(this.crud);

  getData(String email) async {
    var response = await crud.postData(AppLinks.forgetpassword, {"email": email});
    return response.fold((l) => l, (r) => r);
  }
}
