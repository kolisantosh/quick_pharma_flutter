import 'dart:convert';
import 'dart:io';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../apiservice/api_service.dart';
import '../../main.dart';
import '../../model/loginModel.dart';
import '../../utils/storage_utils.dart';
import '../../utils/string_utils.dart';

class OrderStatusController extends GetxController {
  final contentsController = TextEditingController().obs;
  final noteAddedController = TextEditingController().obs;
  final iscontentsEmpty = false.obs;
  final isnoteAEmpty = false.obs;
  final StatusnotSelected = false.obs;
  final TypenotSelected = false.obs;
  final CopaynotSelected = false.obs;

  final listImgPhoto = <File>[].obs;
  final listImgCopay = <File>[].obs;
  final listImgFridge = <File>[].obs;

  final ImagePicker _picker = ImagePicker();

  var statusValue = "Selected Status".obs;
  var typeValue = "Selected Type".obs;
  var copayValue = "Selected Copay".obs;

  List<String> statusList = [
    'Delivered',
    // 'Delivery Attempted',
    // 'Returned',
    // 'Rejected',
    // 'Back to Pharmacy',
    // 'On Its Way To Facility',
    'Not Present',
    // 'Recipient Refused',
    // 'Skipped',
    // 'Wrong Address'
  ];

  List<String> typeList = [
    "Delivered",
    // "Wrong Address",
    "Not Present",
    // "Recipient Refused"
  ];

  List<String> copayList = [
    "Yes",
    "No",
  ];

  @override
  void onReady() {
    super.onReady();
    /*StorageUtil.getData(StorageUtil.keyLoginData).then((value) {
      if (value != null) {
        print("object");
        callGetMenuApi();
      }
    });*/
  }

  callOrderStatusApi(file) {
    checkConnectivity().then((connectivity) async {
      var id = await StorageUtil.getData(StorageUtil.orderId);
      if (connectivity) {
        if (checkString(contentsController.value.text.toString().trim())) {
          iscontentsEmpty.value = true;
        } else if (checkString(
            noteAddedController.value.text.toString().trim())) {
          isnoteAEmpty.value = true;
        } else if (isSame(copayValue.value, "Selected Copay")) {
          CopaynotSelected.value = true;
        } else if (isSame(statusValue.value, "Selected Status")) {
          StatusnotSelected.value = true;
        } else {
          iscontentsEmpty.value = false;
          isnoteAEmpty.value = false;
          CopaynotSelected.value = false;
          StatusnotSelected.value = false;
          TypenotSelected.value = false;
          var params = <String, String>{
            'order_id': id.toString(),
            'contents': contentsController.value.text.toString().trim(),
            'note_added': contentsController.value.text.toString().trim(),
            'is_copay_payed': copayValue.value,
            'status': statusValue.value,
          };
          if (isSame(typeValue.value, "Selected Type"))
            params.addAll({
              'order_activity': typeValue.value,
              'date_to_deliver':
                  '${(DateFormat("yyyy-MM-d").format(DateTime.now()))}',
              'time_to_deliver':
                  '${(DateFormat("HH:mm").format(DateTime.now()))}'
            });
          print("params=>" + params.toString());
          openAndCloseLoadingDialog(true);
          ApiService.CallOrderStatusApi(ApiService.updateOrder, params,
              listImgPhoto, listImgCopay, listImgFridge, file, () {
            openAndCloseLoadingDialog(false);
          }).then((response) {
            openAndCloseLoadingDialog(false);
            if (response == null) {
            } else {
              LoginModel responseData = LoginModel.fromJson(response);
              if ((responseData.error ?? true) == ApiService.ERROR) {
                // callOrderRouteApi();
                Get.back();
                Get.back();
                showSnackBarSucc(responseData.message ?? "");
              } else {
                showSnackBar(responseData.message ?? "");
              }
            }
          });
        }
      }
    });
  }

  callOrderRouteApi() {
    checkConnectivity().then((connectivity) async {
      var id = await StorageUtil.getData(StorageUtil.regionsId);
      var latitude = await StorageUtil.getData(StorageUtil.latitude);
      var longitude = await StorageUtil.getData(StorageUtil.longitude);
      var file;
      if (connectivity) {
        var params = <String, String>{
          'regions_id': id,
          'driver_current_location': jsonEncode({
            'latitude': latitude.toString(),
            'longitude': longitude.toString(),
          }),
          'last_stop': DateFormat("yyyy-MM-dd").format(DateTime.now()),
        };

        openAndCloseLoadingDialog(true);
        ApiService.CallUpdateRouteApi(ApiService.updatemy_route, params, file,
            () {
          openAndCloseLoadingDialog(false);
        }).then((response) {
          openAndCloseLoadingDialog(false);
          if (response == null) {
          } else {
            LoginModel responseData = LoginModel.fromJson(response);
            if ((responseData.error ?? true) == ApiService.ERROR) {
              Get.back();
              Get.back();
              // showSnackBarSucc(responseData.message ?? "");
            } else {
              showSnackBar(responseData.message ?? "");
            }
          }
        });
      }
    });
  }

  Future<void> getCurrentLocation() async {
    Location location = Location();

    location.getLocation().then((loc) {
      StorageUtil.setData(StorageUtil.latitude, loc.latitude);
      StorageUtil.setData(StorageUtil.longitude, loc.longitude);
    });
  }

  openFilePicker(int index) async {
    try {
      XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
      if (index == 1)
        listImgPhoto.add(File(photo!.path));
      else if (index == 2)
        listImgCopay.add(File(photo!.path));
      else
        listImgFridge.add(File(photo!.path));
    } catch (e) {
      _showOpenAppSettingsDialog();
    }
  }

  _showOpenAppSettingsDialog() async {
    print('Permission denied');
    await openAppSettings();
  }

  openCameraPicker(int index) async {
    try {
      XFile? photo = await _picker.pickImage(source: ImageSource.camera);
      if (index == 1)
        listImgPhoto.add(File(photo!.path));
      else if (index == 2)
        listImgCopay.add(File(photo!.path));
      else
        listImgFridge.add(File(photo!.path));
    } catch (e) {
      _showOpenAppSettingsDialog();
    }
  }
}
