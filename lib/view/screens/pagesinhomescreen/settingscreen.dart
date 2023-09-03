import 'package:delivery_e_commerce/controller/home/settingscontroller.dart';
import 'package:delivery_e_commerce/core/constants/colors.dart';
import 'package:delivery_e_commerce/core/constants/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SettingsControllerImp());
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: Get.width / 2,
                width: double.infinity,
                color: Appcolors.blue1,
              ),
              Positioned(
                  top: Get.width / 3.1,
                  //right: Get.width / 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.all(5),
                    child: const CircleAvatar(
                      backgroundImage: AssetImage(Appimageassets.delivery),
                      backgroundColor: Appcolors.grey1,
                      radius: 70,
                    ),
                  ))
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          GetBuilder<SettingsControllerImp>(
              builder: (controller) => Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        ...List.generate(
                            controller.listData.length,
                            (index) => Card(
                                    child: ListTile(
                                  onTap: () {
                                    index == 0
                                        ? controller.goToArchive()
                                        : index == 1
                                            ? print("address")
                                            : index == 2
                                                ? print("aboutus")
                                                : index == 3
                                                    ? controller.contactUs()
                                                    : controller.logout();
                                  },
                                  contentPadding: const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 8),
                                  title: Text(
                                    "${controller.listData[index]['title']}",
                                    style: const TextStyle(
                                      fontSize: 25,
                                    ),
                                  ),
                                  trailing: controller.listData[index]['trailling'],
                                )))
                      ],
                    ),
                  ))
        ],
      ),
    );
  }
}
