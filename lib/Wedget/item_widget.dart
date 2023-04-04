import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quick_pharma/util/ColorConstants.dart';

import '../main.dart';
import '../model/orderModel.dart';

Widget orderDetails({String? mainString, String? subString, Color? color}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          mainText(mainString.toString()),
          Text(
            ':',
            style: TextStyle(
                color: Colors.black, fontSize: 17, fontWeight: FontWeight.w700),
          ),
          InkWell(
            onTap: () {
              if (mainString.toString() == "Recipient Address") {
                Clipboard.setData(ClipboardData(text: subString.toString()));
                showSnackBarSucc("Address Copied..");
              }
            },
            child: subText(
                text: subString.toString(), color: color ?? Color(0xFF888888)),
          ),
        ],
      ),
      SizedBox(
        height: 5,
      ),
      divider()
    ],
  );
}

Widget mainText(String text) {
  return Container(
    width: Get.size.width * 0.45,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(12.0, 10, 12, 10),
      child: Text(
        text,
        overflow: TextOverflow.clip,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w500, fontSize: 17),
      ),
    ),
  );
}

Widget subText({String? text, Color? color}) {
  return Container(
    width: Get.size.width * 0.45,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 10, 12, 10),
      child: Text(
        text.toString(),
        overflow: TextOverflow.clip,
        style: TextStyle(
            color: color ?? Color(0xFF888888),
            fontWeight: FontWeight.w400,
            fontSize: 15),
      ),
    ),
  );
}

Widget divider() {
  return Divider(
    thickness: 1.2,
    color: Color(0xFFDCE8FA),
    height: 5,
    indent: 15,
    endIndent: 15,
  );
}

Widget itemWidget({required VoidCallback ontap, required Orders item, required index}) {
  return Container(
      margin: EdgeInsets.all(10),
      // height: 1500,
      decoration: BoxDecoration(
          color: Color(0xFFF2F5F9),
          border: Border.all(color: Colors.blueAccent),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      child: InkWell(
        onTap: ontap,
        child: Column(
          children: [
            ListTile(
              leading: Container(
                margin: EdgeInsets.all(10),
                // height: 1500,
                decoration: BoxDecoration(
                    color: ColorConstants.appColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Text("${index}",style: TextStyle(color: Colors.white),),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            orderDetails(mainString: "UID", subString: "#${item.id}"),
            orderDetails(mainString: "Status", subString: item.status),
            orderDetails(mainString: "Pharmacy", subString: item.client!.name),
            orderDetails(
                mainString: "Recipient Name", subString: item.recipient!.name),
            orderDetails(
                mainString: "Date to Deliver",
                subString: item.dateToDeliver.toString()),
            orderDetails(
                mainString: "Time to Deliver", subString: item.timeToDeliver),
            orderDetails(
                mainString: "Payout",
                subString: item.payout == null
                    ? "\$0"
                    : "\$" + item.payout.toString()),
            orderDetails(mainString: "Order Type", subString: item.orderType),
          ],
        ),
      ));
}
