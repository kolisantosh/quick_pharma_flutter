import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hand_signature/signature.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quick_pharma/controller/orderStatus_update/orderstatus_controller.dart';
import 'package:screenshot/screenshot.dart';

import '../../../util/ColorConstants.dart';

class OrderStatusPage extends StatefulWidget {
  const OrderStatusPage({Key? key}) : super(key: key);

  @override
  State<OrderStatusPage> createState() => _OrderStatusPageState();
}

class _OrderStatusPageState extends State<OrderStatusPage> {
  final myController = Get.put(OrderStatusController());
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ),
                    Text(
                      'Driver Notes',
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
              height: MediaQuery.of(context).size.height / 60,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 25, 15, 25),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Obx(
                  () => ListView(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    //padding: EdgeInsets.only(left: 10,top: 19,right: 10),
                    children: [
                      textPharma(
                        text: "Order Status",
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      DropdownButtonFormField(
                        validator: (value) {
                          if (value == null) {
                            return "selected order status";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(30.0),
                              ),
                              borderSide: BorderSide(
                                  color: Colors.grey, width: 2), //<-- SEE HERE
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(30.0),
                              ),
                              borderSide: BorderSide(
                                  color: Colors.grey, width: 2), //<-- SEE HERE
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[800]),
                            hintText: "Delivered",
                            fillColor: Colors.white),
                        hint: Text(myController.statusValue.value),
                        onChanged: (Value) {
                          setState(() {
                            myController.statusValue.value = Value.toString();
                          });
                        },
                        items: myController.statusList
                            .map((cityTitle) => DropdownMenuItem(
                                value: cityTitle, child: Text("$cityTitle")))
                            .toList(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      if (myController.statusValue.value == "Delivered" ||
                          myController.statusValue.value ==
                              "Delivery Attempted") ...[
                        textPharma(
                          text: "Activity Type",
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        DropdownButtonFormField(
                          validator: (value) {
                            if (value == null) {
                              return "selected Activity Type";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(30.0),
                                ),
                                borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 2), //<-- SEE HERE
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(30.0),
                                ),
                                borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 2), //<-- SEE HERE
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey[800]),
                              hintText: "Delivered",
                              fillColor: Colors.white),
                          hint: Text(myController.typeValue.value),
                          onChanged: (Value) {
                            setState(() {
                              myController.typeValue.value = Value.toString();
                            });
                          },
                          items: myController.typeList
                              .map((cityTitle) => DropdownMenuItem(
                                  value: cityTitle, child: Text("$cityTitle")))
                              .toList(),
                        ),
                      ],
                      SizedBox(
                        height: 10,
                      ),
                      textPharma(
                        text: "Contents",
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: myController.contentsController.value,
                        decoration: InputDecoration(
                          hintText: "Contents",
                          hintStyle: TextStyle(color: Colors.grey),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(30.0),
                            ),
                            borderSide: BorderSide(
                                color: Colors.grey, width: 2), //<-- SEE HERE
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(30.0),
                            ),
                            borderSide: BorderSide(
                                color: Colors.grey, width: 2), //<-- SEE HERE
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      textPharma(
                        text: "Note added",
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      InkWell(
                        onTap: () {
                          selectDate(
                              context, myController.noteAddedController.value);
                        },
                        child: AbsorbPointer(
                          child: TextFormField(
                            controller: myController.noteAddedController.value,
                            decoration: InputDecoration(
                              hintText: "yyyy-MM-dd",
                              suffixIcon: IconButton(
                                onPressed: () {
                                  selectDate(context,
                                      myController.noteAddedController.value);
                                },
                                icon: Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.grey,
                                ),
                              ),
                              hintStyle: TextStyle(color: Colors.grey),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(30.0),
                                ),
                                borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 2), //<-- SEE HERE
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(30.0),
                                ),
                                borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 2), //<-- SEE HERE
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      textPharma(
                        text: "Is Copay Payed ?",
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      DropdownButtonFormField(
                        validator: (value) {
                          if (value == null) {
                            return "Is Copay Payed ?";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(30.0),
                              ),
                              borderSide: BorderSide(
                                  color: Colors.grey, width: 2), //<-- SEE HERE
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(30.0),
                              ),
                              borderSide: BorderSide(
                                  color: Colors.grey, width: 2), //<-- SEE HERE
                            ),
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey[800]),
                            hintText: "Delivered",
                            fillColor: Colors.white),
                        hint: Text(myController.copayValue.value),
                        onChanged: (Value) {
                          setState(() {
                            myController.copayValue.value = Value.toString();
                          });
                        },
                        items: myController.copayList
                            .map((cityTitle) => DropdownMenuItem(
                                value: cityTitle, child: Text("$cityTitle")))
                            .toList(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          textPharma(
                            text: "Attach Photo",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Wrap(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey,
                                //                   <--- border color
                                width: 2.0,
                              ),
                            ),
                            child: myController.listImgPhoto.length < 1
                                ? Container(
                                    margin: EdgeInsets.only(
                                        left: 10,
                                        right: 20,
                                        top: 20,
                                        bottom: 30),
                                    width: 100,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFE2E4E2),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    alignment: Alignment.center,
                                    child: IconButton(
                                        onPressed: () async {
                                          picDialog(1);
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          color: Colors.black,
                                          size: 30,
                                        )),
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: myController.listImgPhoto.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      if (index ==
                                          myController.listImgPhoto.length -
                                              1) {
                                        return Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10,
                                                  right: 20,
                                                  top: 20,
                                                  bottom: 30),
                                              child: Container(
                                                width: 100,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: FileImage(
                                                        File(myController
                                                            .listImgPhoto[index]
                                                            .path),
                                                      ),
                                                    )),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 10,
                                                  right: 20,
                                                  top: 20,
                                                  bottom: 30),
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                  color: Color(0xFFE2E4E2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              alignment: Alignment.center,
                                              child: IconButton(
                                                  onPressed: () async {
                                                    picDialog(1);
                                                  },
                                                  icon: Icon(
                                                    Icons.add,
                                                    color: Colors.black,
                                                    size: 30,
                                                  )),
                                            ),
                                          ],
                                        );
                                      }

                                      return Padding(
                                        padding: EdgeInsets.only(
                                            left: 10,
                                            right: 20,
                                            top: 20,
                                            bottom: 30),
                                        child: Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: FileImage(
                                                  File(myController
                                                      .listImgPhoto[index]
                                                      .path),
                                                ),
                                              )),
                                        ),
                                      );
                                    }),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      textPharma(
                        text: "Attach Signature",
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Column(
                        children: [
                          Screenshot(
                            controller: screenshotController,
                            child: Container(
                              padding: EdgeInsets.only(
                                left: 10,
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.grey,
                                  //
                                  width: 2.0,
                                ),
                              ),
                              child: Container(
                                constraints: BoxConstraints.expand(),
                                color: Colors.white,
                                child: HandSignature(
                                  control: control,
                                  type: SignatureDrawType.shape,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      if (myController.copayValue.value == "Yes") ...[
                        textPharma(
                          text: "Copay",
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Wrap(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                left: 10,
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.grey,
                                  //                   <--- border color
                                  width: 2.0,
                                ),
                              ),
                              child: myController.listImgCopay.length < 1
                                  ? Container(
                                      margin: EdgeInsets.only(
                                          left: 10,
                                          right: 20,
                                          top: 20,
                                          bottom: 30),
                                      width: 100,
                                      height: 35,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFE2E4E2),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      alignment: Alignment.center,
                                      child: IconButton(
                                          onPressed: () async {
                                            picDialog(2);
                                          },
                                          icon: Icon(
                                            Icons.add,
                                            color: Colors.black,
                                            size: 30,
                                          )),
                                    )
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      itemCount:
                                          myController.listImgCopay.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        if (index ==
                                            myController.listImgCopay.length -
                                                1) {
                                          return Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10,
                                                    right: 20,
                                                    top: 20,
                                                    bottom: 30),
                                                child: Container(
                                                  width: 100,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: FileImage(
                                                          File(myController
                                                              .listImgCopay[
                                                                  index]
                                                              .path),
                                                        ),
                                                      )),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: 10,
                                                    right: 20,
                                                    top: 20,
                                                    bottom: 30),
                                                width: 100,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFFE2E4E2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                alignment: Alignment.center,
                                                child: IconButton(
                                                    onPressed: () async {
                                                      picDialog(2);
                                                    },
                                                    icon: Icon(
                                                      Icons.add,
                                                      color: Colors.black,
                                                      size: 30,
                                                    )),
                                              ),
                                            ],
                                          );
                                        }

                                        return Padding(
                                          padding: EdgeInsets.only(
                                              left: 10,
                                              right: 20,
                                              top: 20,
                                              bottom: 30),
                                          child: Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: FileImage(
                                                    File(myController
                                                        .listImgCopay[index]
                                                        .path),
                                                  ),
                                                )),
                                          ),
                                        );
                                      }),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                      textPharma(
                        text: "Fridge",
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Wrap(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                              left: 10,
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey,
                                //                   <--- border color
                                width: 2.0,
                              ),
                            ),
                            child: myController.listImgFridge.length < 1
                                ? Container(
                                    margin: EdgeInsets.only(
                                        left: 10,
                                        right: 20,
                                        top: 20,
                                        bottom: 30),
                                    width: 100,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFE2E4E2),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    alignment: Alignment.center,
                                    child: IconButton(
                                        onPressed: () async {
                                          picDialog(3);
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          color: Colors.black,
                                          size: 30,
                                        )),
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:
                                        myController.listImgFridge.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      if (index ==
                                          myController.listImgFridge.length -
                                              1) {
                                        return Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 10,
                                                  right: 20,
                                                  top: 20,
                                                  bottom: 30),
                                              child: Container(
                                                width: 100,
                                                height: 100,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: FileImage(
                                                        File(myController
                                                            .listImgFridge[
                                                                index]
                                                            .path),
                                                      ),
                                                    )),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 10,
                                                  right: 20,
                                                  top: 20,
                                                  bottom: 30),
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                  color: Color(0xFFE2E4E2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              alignment: Alignment.center,
                                              child: IconButton(
                                                  onPressed: () async {
                                                    picDialog(3);
                                                  },
                                                  icon: Icon(
                                                    Icons.add,
                                                    color: Colors.black,
                                                    size: 30,
                                                  )),
                                            ),
                                          ],
                                        );
                                      }

                                      return Padding(
                                        padding: EdgeInsets.only(
                                            left: 10,
                                            right: 20,
                                            top: 20,
                                            bottom: 30),
                                        child: Container(
                                          width: 100,
                                          height: 100,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: FileImage(
                                                  File(myController
                                                      .listImgFridge[index]
                                                      .path),
                                                ),
                                              )),
                                        ),
                                      );
                                    }),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xFF181A36),
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        onTap: () async {
                          try {
                            if (control.isFilled) {
                              var image = await screenshotController.capture();
                              if (image == null) return;
                              final file = await _createFileFromString(image);
                              print("file=> " + file.toString());
                              if (file.toString().isNotEmpty)
                                myController.callOrderStatusApi(file);
                            } else
                              print("file=> error");
                          } catch (e) {
                            print(e.toString());
                          }
                        },
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      InkWell(
                        onTap: () async {
                          try {
                            if (control.isFilled) {
                              var image = await screenshotController.capture();
                              if (image == null) return;
                              final file = await _createFileFromString(image);
                              print("file=> " + file.toString());
                              myController.callOrderStatusApi(file);
                            }
                          } catch (e) {
                            print(e.toString());
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: Text(
                            "Delivery attempted",
                            style: TextStyle(color: Colors.white),
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xFF77CFA0),
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      InkWell(
                        onTap: () {
                          control.clear();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: Text(
                            "Clear Signature",
                            style: TextStyle(color: Colors.white),
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xFFF66769),
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  HandSignatureControl control = new HandSignatureControl(
    threshold: 0.01,
    smoothRatio: 0.65,
    velocityRange: 2.0,
  );

  Widget textPharma({
    String? text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Row(
        children: [
          Text(
            text.toString(),
            style: TextStyle(
                color: Color(0xFF002501),
                fontSize: 16,
                fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
  var selectedDate = DateTime.now();
  Future<void> selectDate(
      BuildContext context, TextEditingController controller) async {

    DateFormat formatter = DateFormat('yyyy/MM/dd');
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1901, 1),
        lastDate: DateTime(2222, 1),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        controller.value = TextEditingValue(text: formatter.format(picked));
        selectedDate=picked;
      });
      print(controller.text);
    }
  }

  picDialog(index) {
    Get.bottomSheet(
      Container(
          height: 150,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 25),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 60,
                    ),
                    Row(
                      children: [
                        Text(
                          "Choose Picture",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 60,
                    ),
                    Row(
                      children: [
                        InkWell(
                          child: Column(
                            children: [
                              CircleAvatar(
                                child: Icon(
                                  Icons.camera_alt_sharp,
                                  color: Colors.white,
                                ),
                                backgroundColor: ColorConstants.appColor,
                                radius: 22,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 100,
                              ),
                              Text(
                                "Camera",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                          onTap: () async {
                            myController.openCameraPicker(index);
                            Get.back();
                          },
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.height / 30,
                        ),
                        InkWell(
                          child: Column(
                            children: [
                              CircleAvatar(
                                child: Icon(
                                  Icons.photo_size_select_actual_outlined,
                                  color: Colors.white,
                                ),
                                backgroundColor: ColorConstants.appColor,
                                radius: 22,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 100,
                              ),
                              Text(
                                "Gallery",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                          onTap: () async {
                            myController.openFilePicker(index);
                            Get.back();
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(35),
      ),
    );
  }

  _showOpenAppSettingsDialog(context) async {
    print('Permission denied');
    await openAppSettings();
    // return CustomDialog.show(
    //   context,
    //   'Permission needed',
    //   'Photos permission is needed to select photos',
    //   'Open settings',
    //   openAppSettings,
    // );
  }


  Future<String> _createFileFromString(bytes) async {
    var photosStatus = await Permission.storage.status;
    if (!photosStatus.isGranted) {
      await Permission.storage.request();
    }
    // final result = await ImageGallerySaver.saveImage(bytes, name: "signature");

    String dir = (await getApplicationDocumentsDirectory()).path;
    String fullPath = '$dir/abc.png';
    print("local file full path ${fullPath}");
    File file = File(fullPath);
    await file.writeAsBytes(bytes);
    print(file.path);

    final result = await ImageGallerySaver.saveImage(bytes);
    print(result);
    print("local file full path ${result['filePath']}");
    print("local file full path ${result.toString()}");

    return file.path;
    //
    // print("local file full path ${bytes}");
    // print("local file full path ${result['filePath']}");
    // print("local file full path ${result.toString()}");
    // File file = File(result['filePath'].toString().replaceAll("file://", ""));
    // // await file.writeAsBytes(bytes);
    // print(file.path);
    // return file.path;
  }

  checkpermission_storage() async {
    var photosStatus = await Permission.storage.status;
    if (!photosStatus.isGranted) {
      await Permission.storage.request();
    }
    var cameraStatus = await Permission.camera.status;
    if (!cameraStatus.isGranted) {
      await Permission.camera.request();
    }
  }
}
