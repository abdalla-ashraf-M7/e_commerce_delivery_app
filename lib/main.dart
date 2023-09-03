import 'package:delivery_e_commerce/core/bindings/bindings.dart';
import 'package:delivery_e_commerce/core/localization/changelocal.dart';
import 'package:delivery_e_commerce/core/localization/translation.dart';
import 'package:delivery_e_commerce/core/services/services.dart';
import 'package:delivery_e_commerce/routes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialservices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageController languageController = Get.put(LanguageController());
    return GetMaterialApp(
      getPages: routes,
      initialBinding: MyBindigs(),
      debugShowCheckedModeBanner: false,
      translations: MyTranslations(),
      theme: languageController.apptheme,
      locale: languageController.langauge,
    );
  }
}
