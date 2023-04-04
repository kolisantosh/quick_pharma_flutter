
import 'package:get/get.dart';

import 'change_controller.dart';

class ChangePwdBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<ChangePwdController>(ChangePwdController());
  }

}