import 'dart:convert';
import 'package:get/get.dart';

import '../../apiservice/api_service.dart';
import '../../main.dart';
import '../../model/dashboardModel.dart';
import '../../utils/storage_utils.dart';

class DashBoardController extends GetxController {

  var totalOrdersToday = 0.obs;
  var totalOrdersThisMonth = 0.obs;
  var totalOrdersPending = 0.obs;
  var totalOrdersComplete = 0.obs;
  var totalEarningsMonth = 0.obs;

  @override
  void onReady() {
    super.onReady();
    StorageUtil.getData(StorageUtil.keyLoginData).then((value) {
      if (value != null) {
        print("object");
        callDashBoardApi();
      }
    });
  }

  callDashBoardApi() {
    checkConnectivity().then((connectivity) {
      if (connectivity) {
        var params = <String, String>{
        };
        openAndCloseLoadingDialog(true);
        ApiService.callPostApi(
            ApiService.dashboard_statistics, jsonEncode(params), () {
          openAndCloseLoadingDialog(false);
        }).then((response) {
          if (response == null) {} else {
            openAndCloseLoadingDialog(false);
            DashBoardModel responseData = DashBoardModel.fromJson(response);
            if ((responseData.error ?? true) == ApiService.ERROR) {
              // showSnackBar(responseData.message ?? "");
              totalOrdersToday.value=responseData.data!.totalOrdersToday??0;
              totalOrdersThisMonth.value=responseData.data!.totalOrdersThisMonth??0;
              totalOrdersPending.value=responseData.data!.totalOrdersPending??0;
              totalOrdersComplete.value=responseData.data!.totalOrdersComplete??0;
              totalEarningsMonth.value=responseData.data!.totalEarningsMonth??0;
            } else {
              showSnackBar(responseData.message ?? "");
            }
          }
        });
      }
    });
  }

}
