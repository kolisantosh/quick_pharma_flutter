
import 'package:get/get.dart';

import 'earning_controller.dart';

class EarningBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<EarningController>(EarningController());
  }

}