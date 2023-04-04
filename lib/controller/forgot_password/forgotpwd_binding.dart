
import 'package:get/get.dart';

import 'forgotpwd_controller.dart';

class ForgotPwdBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<ForgotPwdController>(ForgotPwdController());
  }

}