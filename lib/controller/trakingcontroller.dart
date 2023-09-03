import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_e_commerce/controller/order/acceptedcontroller.dart';
import 'package:delivery_e_commerce/controller/order/pendingscontroller.dart';
import 'package:delivery_e_commerce/core/constants/approutes.dart';
import 'package:delivery_e_commerce/core/functions/getdecodepolyline.dart';
import 'package:delivery_e_commerce/core/services/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../core/class/requeststatus.dart';
import '../data/model/ordersmodel.dart';

class TrackingController extends GetxController {
  MyServices myServices = Get.find();
  AcceptedControllerImp? c;
  PendingsControllerImp? cc;
  StreamSubscription<Position>? positionStream;
  bool isUpdatingLocation = false;

  late OrdersModel rrOrderModel;
  GoogleMapController? gmController;
  CameraPosition? initPosition;
  Timer? timer;
  List<Marker> markers = [];
  requeststatus requeststate = requeststatus.success;
  double? currentlat;
  double? currentlong;
  double? dstlat;
  double? dstlong;
  bool isPolylineDrawn = false;

  Set<Polyline> polylinesetintraking = {};

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  initialData() {
    rrOrderModel = Get.arguments['ordermodel'];
    addmarker(LatLng(double.parse("${rrOrderModel.addressLat}"), double.parse("${rrOrderModel.addressLong}")), "customer");
    getCurrentLocationStream();
    refreshLocation();
    //
  }

  doneOrderinTrackingPage() {
    requeststate = requeststatus.loading;
    update();
    if (Get.isRegistered<AcceptedControllerImp>()) {
      c = Get.find<AcceptedControllerImp>();
      c!.doneOrder(rrOrderModel.ordersId!, rrOrderModel.ordersUser!);
    } else {
      cc = Get.find<PendingsControllerImp>();
      cc!.doneOrder(rrOrderModel.ordersId!, rrOrderModel.ordersUser!);
    }
    Get.offAllNamed(Approutes.homescreen);
  }

  getCurrentLocationStream() async {
    if (!isUpdatingLocation) {
      isUpdatingLocation = true;
      positionStream = Geolocator.getPositionStream().listen((Position? position) {
        currentlat = position!.latitude;
        currentlong = position.longitude;
        initialPolyline();
        initPosition = CameraPosition(
          target: LatLng(currentlat!, currentlong!),
          zoom: 14,
        );
        if (gmController != null) {
          gmController!.animateCamera(CameraUpdate.newLatLng(LatLng(currentlat!, currentlong!)));
        }
        markers.removeWhere(
          (element) => element.markerId == const MarkerId("current"),
        );
        addmarker(LatLng(currentlat!, currentlong!), "current");

        print("********current********");
        print('${currentlong.toString()}, ${currentlong.toString()}');
        print('${rrOrderModel.addressLat.toString()}, ${rrOrderModel.addressLong.toString()}');
        update();
      });
    }

    update();
  }

  initialPolyline() async {
    dstlat = double.parse(rrOrderModel.addressLat!);
    dstlong = double.parse(rrOrderModel.addressLong!);
    //  await Future.delayed(Duration(seconds: 5));
    polylinesetintraking = await getpolyline(currentlat, currentlong, dstlat, dstlong);
    isPolylineDrawn = true;
    print(")))))))))))initialPolyLine)))))))))");
    update();
  }

  refreshLocation() async {
    Future.delayed(Duration(seconds: 2));
    timer = Timer.periodic(
      Duration(seconds: 15),
      (timer) {
        FirebaseFirestore.instance.collection("delivery").doc(rrOrderModel.ordersId).set({"lat": currentlat, "long": currentlong, "id": myServices.sharedPrefs!.getString("id")});
        print("&&&&&&&&&&&&&Sending To firebase&&&&&&&&&&&&&&&&&");
      },
    );
  }

  addmarker(latLng, id) {
    markers.add(Marker(markerId: MarkerId(id), position: latLng));
    update();
  }

  goToHome() {
    Get.offAllNamed(Approutes.homescreen);
  }

  @override
  void refresh() {
    super.refresh();
  }

  @override
  void onClose() {
    gmController!.dispose();
    positionStream!.cancel();
    timer!.cancel();
    super.onClose();
  }
}
