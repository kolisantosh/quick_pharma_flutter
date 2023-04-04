import 'package:get/get.dart';

class Dimensions{
  static double fontSizeExtraSmall = Get.context!.width >= 1300 ? 14 : 20;
  static double fontSizeSmall = Get.context!.width >= 1300 ? 16 : 16;
  static double fontSizeDefault = Get.context!.width >= 1300 ? 18 : 14;
  static double fontSizeLarge = Get.context!.width >= 1300 ? 20 : 32;
  static double fontSizeExtraLarge = Get.context!.width >= 1300 ? 22 : 36;
  static double fontSizeOverLarge = Get.context!.width >= 1300 ? 28 : 24;
}