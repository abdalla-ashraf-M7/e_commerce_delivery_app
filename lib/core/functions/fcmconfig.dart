import 'package:delivery_e_commerce/controller/order/pendingscontroller.dart';
import 'package:delivery_e_commerce/core/constants/approutes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:just_audio/just_audio.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/imageassets.dart';

permissionNotification() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }
}

fcmConfig() {
  AudioPlayer audioPlayer = AudioPlayer();
  FirebaseMessaging.onMessage.listen((message) async {
    print("==============================notification===========");
    print(message.notification!.title);
    print(message.notification!.body);

    Get.snackbar(
      "", "",
      titleText: Text(
        message.notification!.title!,
        style: TextStyle(fontSize: 25, color: Appcolors.white),
      ),
      messageText: Text(message.notification!.body!, style: TextStyle(fontSize: 15, color: Appcolors.white)),
      snackPosition: SnackPosition.TOP, // position
      backgroundColor: Appcolors.purple2.withOpacity(.8), // background color
      colorText: Colors.white, // text color
      icon: Icon(Icons.error, color: Colors.white), // icon
      duration: Duration(seconds: 5), // duration
      animationDuration: Duration(milliseconds: 500), // animation duration
      mainButton: TextButton(
        onPressed: () {
          Get.back(); // close the snackbar
        },
        child: Text(
          'Dismiss',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
    await audioPlayer.setAsset(Appimageassets.notification);
    await audioPlayer.play();
    refrechNotificationPage(message.data);
  });
}

Future<void> backgroundMessageHandler(RemoteMessage message) async {
  print("==============================Background notification===========");

  print("Handling a background message: ${message.notification!.title}");
  print("Handling a background message: ${message.notification!.body}");
}

refrechNotificationPage(Map data) {
  print("====================");
  print(data['pageid']);
  print(data['pagename']);
  if (Get.currentRoute == "/pendings" && data['pagename'] == "pendings") {
    PendingsControllerImp controller = Get.find();
    controller.refreshMyOrderspage();
  } else if (Get.currentRoute != "/pendings" && data['pagename'] == "pendings") {
    Get.offNamed(Approutes.pendings);
  }
}
