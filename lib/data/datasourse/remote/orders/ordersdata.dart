import 'package:get/get.dart';
import '../../../../core/class/curd.dart';
import '../../../../core/constants/applinks.dart';

class OrderData {
  Crud crud = Get.find();
  OrderData(this.crud);

  getPendings() async {
    var reponse = await crud.postData(AppLinks.pendings, {});
    return reponse.fold((l) => l, (r) => r);
  }

  getArchives(String deliveryid) async {
    var reponse = await crud.postData(AppLinks.orderArchive, {
      "deliveryid": deliveryid,
    });
    return reponse.fold((l) => l, (r) => r);
  }

  getAccepted(String deliveryid) async {
    var reponse = await crud.postData(AppLinks.accepted, {
      "deliveryid": deliveryid,
    });
    return reponse.fold((l) => l, (r) => r);
  }

  getOrderDetails(String orderid) async {
    var reponse = await crud.postData(AppLinks.orderdetails, {
      "orderid": orderid,
    });
    return reponse.fold((l) => l, (r) => r);
  }

  orderDone(String orderid, String userid, String deliveryid, String time) async {
    var reponse = await crud.postData(AppLinks.orderDone, {
      "orderid": orderid,
      "userid": userid,
      "deliveryid": deliveryid,
      "time": time,
    });
    return reponse.fold((l) => l, (r) => r);
  }

  orderApprove(String orderid, String userid, String deliveryid, String time) async {
    var reponse = await crud.postData(AppLinks.orderApprove, {
      "orderid": orderid,
      "userid": userid,
      "deliveryid": deliveryid,
      "time": time,
    });
    return reponse.fold((l) => l, (r) => r);
  }
}
