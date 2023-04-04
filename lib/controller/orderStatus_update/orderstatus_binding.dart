
import 'package:get/get.dart';

import 'orderstatus_controller.dart';

class OrderStatusBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<OrderStatusController>(OrderStatusController());
  }

}