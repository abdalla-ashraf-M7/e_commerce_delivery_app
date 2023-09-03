import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/order/pendingscontroller.dart';
import '../../../core/class/handlingdatview.dart';
import '../../widgets/order/customorderlist.dart';

class PendingsScreen extends StatelessWidget {
  const PendingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PendingsControllerImp cc = Get.put(PendingsControllerImp());
    return RefreshIndicator(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Pendings'),
          ),
          body: GetBuilder<PendingsControllerImp>(
              builder: (controller) => HandlinDataView(
                  requeststat: controller.requeststate,
                  widget: ListView(
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.data.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 5,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return CustomCardOrders(
                            ordersModel: controller.data[index],
                            i: index,
                            onTapDetails: () {
                              controller.gotoDetails(controller.data[index]);
                            },
                          );
                        },
                      ),
                    ],
                  ))),
        ),
        onRefresh: () async {
          cc.refreshMyOrderspage();
        });
  }
}
