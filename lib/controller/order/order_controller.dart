import 'dart:convert';
import 'package:get/get.dart';
import 'package:location/location.dart';

import '../../apiservice/api_service.dart';
import '../../main.dart';
import '../../model/orderModel.dart';
import '../../utils/storage_utils.dart';
import '../../view/screens/scanner_Screen/update_status.dart';

class OrderController extends GetxController {
  final listOrderData = <Orders>[].obs;
  var emapty = false.obs;
  var search = "";
  var id = "";

  // LocationData currentLocation = (){}.obs as LocationData;

  @override
  void onReady() {
    super.onReady();
    // StorageUtil.getData(StorageUtil.keyLoginData).then((value) {
    //   if (value != null) {
    //     print("object");
    //     // callGetOrdersApi();
    //   }
    // });
  }

  /* getCurrentLocation() {
    Location location = Location();

    location.getLocation().then((loc) {
      currentLocation = loc;
      print(currentLocation.toString());
    });

    location.onLocationChanged.listen((newloc) {
      currentLocation = newloc;
      print(currentLocation.toString());
    });
  }*/

  searchData(search) {
    this.search = search;
    callSearchOrdersApi();
  }

  scanData(id) {
    this.id = id;
    callScanOrdersApi();
  }

  callGetOrdersApi(id) {
    checkConnectivity().then((connectivity) {
      if (connectivity) {
        var params = <String, String>{
          'regions_id': id.toString(),
        };
        openAndCloseLoadingDialog(true);
        ApiService.callPostApi(ApiService.getOrder, jsonEncode(params), () {
          openAndCloseLoadingDialog(false);
        }).then((response) {
          if (response == null) {
          } else {
            openAndCloseLoadingDialog(false);
            OrderModel responseMainModel = OrderModel.fromJson(response);
            if ((responseMainModel.error ?? true) == ApiService.ERROR) {
              listOrderData.clear();
              listOrderData.value = responseMainModel.data;
            } else {
              emapty.value = true;
              showSnackBar(responseMainModel.message ?? "");
            }
          }
        });
      }
    });
  }

  callSearchOrdersApi() {
    checkConnectivity().then((connectivity) {
      if (connectivity) {
        var params = <String, String>{
          'search': search,
          // 'status': "Delivered",
          // 'password': passwordController.value.text.toString().trim()
        };
        // openAndCloseLoadingDialog(true);
        ApiService.callPostApi(ApiService.getOrder, jsonEncode(params), () {
          openAndCloseLoadingDialog(false);
        }).then((response) {
          if (response == null) {
          } else {
            openAndCloseLoadingDialog(false);
            OrderModel responseMainModel = OrderModel.fromJson(response);
            if ((responseMainModel.error ?? true) == ApiService.ERROR) {
              listOrderData.clear();
              listOrderData.value = responseMainModel.data;
            } else {
              showSnackBar(responseMainModel.message ?? "");
            }
          }
        });
      }
    });
  }

  callScanOrdersApi() {
    checkConnectivity().then((connectivity) {
      if (connectivity) {
        var params = <String, String>{
          'id': id,
          // 'password': passwordController.value.text.toString().trim()
        };
        openAndCloseLoadingDialog(true);
        ApiService.callPostApi(ApiService.getOrder, jsonEncode(params), () {
          openAndCloseLoadingDialog(false);
        }).then((response) {
          if (response == null) {
          } else {
            openAndCloseLoadingDialog(false);
            OrderModel responseMainModel = OrderModel.fromJson(response);
            if ((responseMainModel.error ?? true) == ApiService.ERROR) {
              // listOrderData.clear();
              // listOrderData.value = responseMainModel.data;
              Get.to(OrderStatusPage());
            } else {
              showSnackBar(responseMainModel.message ?? "");
            }
          }
        });
      }
    });
  }
}
