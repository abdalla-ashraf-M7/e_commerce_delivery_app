import 'package:delivery_e_commerce/controller/order/acceptedcontroller.dart';
import 'package:delivery_e_commerce/view/widgets/order/customorderlistaccepted.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/class/handlingdatview.dart';

class AcceptdScreen extends StatelessWidget {
  const AcceptdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AcceptedControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accepted'),
      ),
      body: GetBuilder<AcceptedControllerImp>(
          builder: (controller) => RefreshIndicator(
              child: HandlinDataView(
                  requeststat: controller.requeststate,
                  widget: ListView(
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.data.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 5);
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return CustomCardOrdersAccepted(
                            ordersModel: controller.data[index],
                            i: index,
                            onTapDetails: () {
                              controller.gotoDetails(index);
                            },
                            onTapIconCheck: () {
                              controller.doneOrder(controller.data[index].ordersId!, controller.data[index].ordersUser!);
                            },
                          );
                        },
                      ),
                    ],
                  )),
              onRefresh: () async {
                controller.refreshAcceptedpage();
              })),
    );
  }
}
