import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:quick_pharma/controller/order/order_controller.dart';
import '../../../util/ColorConstants.dart';
import '../../../util/appText.dart';
import '../../../util/dimensions.dart';
import '../../../util/styles.dart';
import '../../../utils/storage_utils.dart';

class ScannerScreen extends StatefulWidget {
  ScannerScreen({Key? key, this.back = false}) : super(key: key);
  bool back;

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  final mycontroller = Get.put(OrderController());
  QRViewController? controller;

  void reassemble() {
    super.reassemble();
    if (controller != null) {
      if (Platform.isAndroid) {
        controller!.pauseCamera();
      } else if (Platform.isIOS) {
        controller!.resumeCamera();
      }
    }
  }


  checkpermission_camera() async {
    var photosStatus = await Permission.camera.status;
    if (!photosStatus.isGranted) {
      await Permission.camera.request();
    }
  }

  @override
  void dispose() {
    if (controller != null) {
      controller!.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.appColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    widget.back
                        ? InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                          )
                        : Container(),
                    Text(
                      AppText.scanner,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    Container(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: QRView(
                    cameraFacing: CameraFacing.back,
                    key: qrKey,
                    onQRViewCreated: onQRViewCreated,
                    overlay: QrScannerOverlayShape(
                      // overlayColor:Color(0xFFF2D5F2E) ,
                      borderColor: Color(0xFFFC7DFCA),
                      cutOutSize: MediaQuery.of(context).size.width * 0.8,
                    ),
                    onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    print('${DateTime.now().toIso8601String()}_onPermissionSet $p');

    checkpermission_camera();
    // if (!p) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(content: Text('no Permission')),
    //   );
    // }
  }

  var show=true;
  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      reassemble();

      setState(() {
        Barcode result = scanData;
        print("result=>" + result.code.toString());
        if(show){
          setState(() {
            show=false;
          });
        BarcodeDialog(result.code.toString());
        }
      });
    });
  }

  BarcodeDialog(String code) {
    Get.defaultDialog(
        backgroundColor: Color(0xFFFC7DFCA),
        title: "",
        middleText: "",
        content: Container(
          padding: EdgeInsets.only(left: 20),
          height: 180,
          width: Get.size.width,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Complete Orders Status",
                    style: poppinsMedium.copyWith(
                        fontSize: Dimensions.fontSizeSmall,
                        color: Colors.black),
                  )
                ],
              ),
              SizedBox(
                height: Get.size.height / 30,
              ),
              Column(
                children: [
                  Text(
                    "Scan the order and update the status",
                    style: poppinsRegular.copyWith(
                        fontSize: Dimensions.fontSizeSmall,
                        color: Colors.black),
                  )
                ],
              ),
              SizedBox(
                height: Get.size.height / 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () async {
                      await controller!.resumeCamera();
                      setState(() {
                        show=true;
                      });
                      Get.back();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(22))),
                      child: Text(
                        AppText.cancel,
                        style: poppinsMedium.copyWith(
                            fontSize: Dimensions.fontSizeDefault,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      // await controller!.resumeCamera();
                      StorageUtil.setData(StorageUtil.orderId, code);
                      mycontroller.scanData(code);
                      // setState(() {
                      //   show=true;
                      // });
                      // Get.back();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                          color: ColorConstants.appColor,
                          borderRadius: BorderRadius.all(Radius.circular(22))),
                      child: Text(
                        "Update Status",
                        style: poppinsMedium.copyWith(
                            fontSize: Dimensions.fontSizeDefault,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
