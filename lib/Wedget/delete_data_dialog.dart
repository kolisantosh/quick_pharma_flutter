
import 'package:quick_pharma/Wedget/widget_background_container.dart';
import 'package:quick_pharma/util/styles.dart';

import '../util/ColorConstants.dart';
import '../util/appText.dart';
import '../util/app_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteDataDialog extends GetView {
  String message;
  VoidCallback onCancelClick;
  VoidCallback onDeleteClick;

  DeleteDataDialog(
      {Key? key,
      required this.message,
      required this.onCancelClick,
      required this.onDeleteClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(size_20),
      width: MediaQuery.of(Get.context!).size.width / 3,
      decoration: BoxDecoration(
          color: ColorConstants.white, borderRadius: BorderRadius.circular(size_10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.cancel_outlined,
            size: size_100,
            color: ColorConstants.appColor,
          ),
          SizedBox(
            height: size_20,
          ),
          Text(msgAreYouSure,
              style: textMedium
                  .copyWith(fontSize: font_18, color: ColorConstants.appColor),
              textAlign: TextAlign.center),
          SizedBox(
            height: size_20,
          ),
          Text(message,
              style: textRegular
                  .copyWith(fontSize: font_14, color: ColorConstants.black),
              textAlign: TextAlign.center),
          SizedBox(
            height: size_40,
          ),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                WidgetBackgroundContainer(
                  child: Text(
                    "lblCancel",
                    style: textSemiBold
                        .copyWith(color: ColorConstants.black, fontSize: font_14),
                  ),
                  paddingContainer: EdgeInsets.symmetric(
                      vertical: size_10, horizontal: size_15),
                  backColor: ColorConstants.gray50,
                  cornerRadius: size_5,
                  onClickAction: () {
                    Get.back();
                    onCancelClick();
                  },
                ),
                SizedBox(
                  width: size_10,
                ),
                WidgetBackgroundContainer(
                  child: Text(
                    "lblDelete",
                    style: textSemiBold
                        .copyWith(color: ColorConstants.white, fontSize: font_14),
                  ),
                  paddingContainer: EdgeInsets.symmetric(
                      vertical: size_10, horizontal: size_15),
                  backColor: ColorConstants.appColor,
                  cornerRadius: size_5,
                  onClickAction: () {
                    Get.back();
                    onDeleteClick();
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
