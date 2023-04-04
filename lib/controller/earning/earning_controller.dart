import 'dart:convert';
import 'package:get/get.dart';
import 'package:quick_pharma/apiservice/api_service.dart';

import '../../../main.dart';
import '../../../model/earningModel.dart';

class EarningController extends GetxController {
  final listEarningData = <Earning>[].obs;
  var from = "";
  var to = "";

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

  searchData(search, to) {
    this.from = search;
    this.to = to;
    print(from.toString());
    print(to.toString());
    callGetOrdersApi();
  }

  callGetOrdersApi() {
    checkConnectivity().then((connectivity) {
      if (connectivity) {
        var params = <String, String>{
          'from': from,
          'to': to,
        };
        openAndCloseLoadingDialog(true);
        ApiService.callPostApi(ApiService.driver_statistics, jsonEncode(params),
            () {
          openAndCloseLoadingDialog(false);
        }).then((response) {
          if (response == null) {
          } else {
            openAndCloseLoadingDialog(false);
            EarningModel responseMainModel = EarningModel.fromJson(response);
            if ((responseMainModel.error ?? true) == ApiService.ERROR) {
              listEarningData.clear();
              listEarningData.value = responseMainModel.data;
            } else {
              showSnackBar(responseMainModel.message ?? "");
            }
          }
        });
      }
    });
  }
}
