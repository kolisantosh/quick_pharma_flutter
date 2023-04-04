
import 'package:get/get.dart';

import 'route_controller.dart';

class RouteBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<RouteController>(RouteController());
  }

}