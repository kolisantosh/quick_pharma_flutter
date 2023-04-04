import 'dart:convert';
import 'package:get/get.dart';
import 'package:quick_pharma/controller/order/order_controller.dart';

import '../../apiservice/api_service.dart';
import '../../main.dart';
import '../../model/routeModel.dart';

class RouteController extends GetxController {
  final listRouteData = <Routes>[].obs;
  var emapty = false.obs;
  var search = "";
  var id = 0;
  final mycontroller=Get.put(OrderController());


  // LocationData currentLocation = (){}.obs as LocationData;

  @override
  void onReady() {
    super.onReady();
    // StorageUtil.getData(StorageUtil.keyLoginData).then((value) {
    //   if (value != null) {
    //     print("object");
    //     callGetRoutesApi();
    //   }
    // });
  }




  callGetRoutesApi() {
    checkConnectivity().then((connectivity) {
      if (connectivity) {
        var params = <String, String>{
          // 'status': "Delivered",
          // 'search': search,
          // 'password': passwordController.value.text.toString().trim()
        };
        openAndCloseLoadingDialog(true);
        ApiService.callPostApi(ApiService.getmy_route, jsonEncode(params), () {
          openAndCloseLoadingDialog(false);
        }).then((response) {
          if (response == null) {
          } else {
            openAndCloseLoadingDialog(false);
            RouteModel responseMainModel = RouteModel.fromJson(response);
            if ((responseMainModel.error ?? true) == ApiService.ERROR) {
              listRouteData.clear();
              listRouteData.value = responseMainModel.data;
              if(listRouteData.length>0) {
                id = listRouteData[0].id;
                mycontroller.callGetOrdersApi(id);
              }else{
                emapty.value=true;
              }
            } else {
              emapty.value=true;
              showSnackBar(responseMainModel.message ?? "");
            }
          }
        });
      }
    });
  }

}
