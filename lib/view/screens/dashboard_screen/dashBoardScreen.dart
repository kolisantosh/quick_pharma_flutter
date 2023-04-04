import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_pharma/controller/dashboard/dashboard_controller.dart';
import 'package:quick_pharma/util/ColorConstants.dart';
import 'package:quick_pharma/util/dimensions.dart';
import 'package:quick_pharma/util/styles.dart';
import 'package:quick_pharma/view/screens/Earnings_Screen/earnings_Screen.dart';

import '../../../controller/profile/profile_controller.dart';
import '../../../model/loginModel.dart';
import '../../../util/appText.dart';
import '../../../util/constants.dart';
import '../../../util/images.dart';
import '../../../utils/storage_utils.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final myController1 = Get.put(DashBoardController());
  final myController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    getUserData();
    myController1.callDashBoardApi();
  }

  getUserData() {
    StorageUtil.getData(StorageUtil.keyLoginData).then((value) {
      if (value != null) {
        UserData data = UserData.fromJson(jsonDecode(value));
        setState(() {
          AppConstants.userName = data.name ?? "";
          AppConstants.userMobile = data.phone ?? "";
          AppConstants.userEmail = data.email ?? "";
          AppConstants.userProfileImage = data.avatar ?? "";
          AppConstants.userUnm = data.username ?? "";
          AppConstants.userLoc = data.address ?? "";
          AppConstants.userId = data.id!;
          print("userId=>${AppConstants.userId}");
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.appColor,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   centerTitle: true,
      //   title: Text("Home",
      //       style: poppinsSemiBold.copyWith(
      //           fontSize: Dimensions.fontSizeOverLarge, color: Colors.white)),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Text(
                            "Home",
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
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            Expanded(
                child: Obx(
              () => Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: ListView(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: ColorConstants.appColorbg,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 20,
                          ),
                          myController.imageUrl.value != ""
                              ? Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100))),
                                  child: CachedNetworkImage(
                                    imageUrl: myController.imageUrl.value,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(100))),
                                    ),
                                    placeholder: (context, url) => Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        ClipOval(
                                            child: Image.asset(Images.qpLogo)),
                                  ),
                                )
                              : Container(
                                  alignment: Alignment.bottomRight,
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(Images.qpLogo),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100))),
                                ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            myController.nameController.value.text,
                            style: poppinsSemiBold.copyWith(
                                fontSize: Dimensions.fontSizeOverLarge,
                                color: ColorConstants.appColor),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "${myController1.totalEarningsMonth.value}\$",
                            style: poppinsSemiBold.copyWith(
                                fontSize: Dimensions.fontSizeExtraSmall,
                                color: ColorConstants.earningColor),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(EarningScreen());
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2,
                              height: MediaQuery.of(context).size.height * 0.08,
                              decoration: BoxDecoration(
                                color: ColorConstants.appColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                AppText.myEarnings,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          divider(),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "Progress",
                                    style: TextStyle(
                                        color: ColorConstants.appColor),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "",
                                        style: TextStyle(
                                            color: ColorConstants.appColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25),
                                      ),
                                      Text(
                                        myController1.totalOrdersComplete.value == 0
                                            ? "0%"
                                            : "${double.parse((int.parse(myController1.totalOrdersComplete.value.toString()) * 100 / (int.parse(myController1.totalOrdersComplete.value.toString()) + int.parse(myController1.totalOrdersPending.value.toString()))).toString()).toStringAsFixed(2)}%",
                                        style: TextStyle(
                                            color: ColorConstants.orangeColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Undelivered",
                                    style: TextStyle(
                                        color: ColorConstants.appColor),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        myController1.totalOrdersPending.value
                                            .toString(),
                                        style: TextStyle(
                                            color: ColorConstants.appColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25),
                                      ),
                                      Text(
                                        myController1.totalOrdersPending.value == 0
                                            ? "0%"
                                            : "${double.parse((int.parse(myController1.totalOrdersPending.value.toString()) * 100 / (int.parse(myController1.totalOrdersComplete.value.toString()) + int.parse(myController1.totalOrdersPending.value.toString()))).toString()).toStringAsFixed(2)}%",
                                        style: TextStyle(
                                            color: ColorConstants.orangeColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Delivered",
                                    style: TextStyle(
                                        color: ColorConstants.appColor),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        myController1.totalOrdersComplete.value
                                            .toString(),
                                        style: TextStyle(
                                            color: ColorConstants.appColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25),
                                      ),
                                      Text(
                                        myController1.totalOrdersComplete
                                                    .value ==
                                                0
                                            ? "0%"
                                            : "${double.parse((int.parse(myController1.totalOrdersComplete.value.toString()) * 100 / (int.parse(myController1.totalOrdersComplete.value.toString()) + int.parse(myController1.totalOrdersPending.value.toString()))).toString()).toStringAsFixed(2)}%",
                                        style: TextStyle(
                                            color: ColorConstants.orangeColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    /*     Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: MediaQuery.of(context).size.height / 30,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 103,
                              decoration: BoxDecoration(
                                  color: Color(0xFFFF2F5F9),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("${myController1.totalOrdersToday}",
                                      style: poppinsSemiBold.copyWith(
                                          fontSize:
                                              Dimensions.fontSizeOverLarge,
                                          color: Colors.black)),
                                  Text(
                                    "Total Orders Today",
                                    style: poppinsRegular.copyWith(
                                        fontSize: Dimensions.fontSizeDefault,
                                        color: Color(0xFFF888888)),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              height: 103,
                              decoration: BoxDecoration(
                                  color: Color(0xFFFF2F5F9),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("${myController1.totalOrdersThisMonth}",
                                      style: poppinsSemiBold.copyWith(
                                          fontSize:
                                              Dimensions.fontSizeOverLarge,
                                          color: Colors.black)),
                                  Text(
                                    "Total Orders Month",
                                    style: poppinsRegular.copyWith(
                                        fontSize: Dimensions.fontSizeDefault,
                                        color: Color(0xFFF888888)),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              height: 103,
                              decoration: BoxDecoration(
                                  color: Color(0xFFFF2F5F9),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("${myController1.totalOrdersPending}",
                                      style: poppinsSemiBold.copyWith(
                                          fontSize:
                                              Dimensions.fontSizeOverLarge,
                                          color: Colors.black)),
                                  Text(
                                    "Total Orders Pending",
                                    style: poppinsRegular.copyWith(
                                        fontSize: Dimensions.fontSizeDefault,
                                        color: Color(0xFFF888888)),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        bottom: 20,
                        top: MediaQuery.of(context).size.height / 60,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 103,
                              decoration: BoxDecoration(
                                  color: Color(0xFFFF2F5F9),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("2",
                                      style: poppinsSemiBold.copyWith(
                                          fontSize:
                                              Dimensions.fontSizeOverLarge,
                                          color: Colors.black)),
                                  Text(
                                    "Total Reviews",
                                    style: poppinsRegular.copyWith(
                                        fontSize: Dimensions.fontSizeDefault,
                                        color: Color(0xFFF888888)),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              height: 103,
                              decoration: BoxDecoration(
                                  color: Color(0xFFFF2F5F9),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("10 \$",
                                      style: poppinsSemiBold.copyWith(
                                          fontSize:
                                              Dimensions.fontSizeOverLarge,
                                          color: Colors.black)),
                                  Text(
                                    "Total Earning",
                                    style: poppinsRegular.copyWith(
                                        fontSize: Dimensions.fontSizeDefault,
                                        color: Color(0xFFF888888)),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              height: 103,
                              decoration: BoxDecoration(
                                  color: Color(0xFFFF2F5F9),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("${myController1.totalOrdersComplete}",
                                      style: poppinsSemiBold.copyWith(
                                          fontSize:
                                              Dimensions.fontSizeOverLarge,
                                          color: Colors.black)),
                                  Text(
                                    "Total Orders Complete",
                                    style: poppinsRegular.copyWith(
                                        fontSize: Dimensions.fontSizeDefault,
                                        color: Color(0xFFF888888)),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )*/
                  ],
                ),
              ),
            ))
          ],
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
}

/*class _DashBoardScreenState extends State<DashBoardScreen> {
  final myController = Get.put(DashBoardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.appColor,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   centerTitle: true,
      //   title: Text("Home",
      //       style: poppinsSemiBold.copyWith(
      //           fontSize: Dimensions.fontSizeOverLarge, color: Colors.white)),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Text(
                            "Home",
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
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            Expanded(
                child: Obx(
              () => Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: MediaQuery.of(context).size.height / 30,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 103,
                              decoration: BoxDecoration(
                                  color: Color(0xFFFF2F5F9),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("${myController.totalOrdersToday}",
                                      style: poppinsSemiBold.copyWith(
                                          fontSize:
                                              Dimensions.fontSizeOverLarge,
                                          color: Colors.black)),
                                  Text(
                                    "Total Orders Today",
                                    style: poppinsRegular.copyWith(
                                        fontSize: Dimensions.fontSizeDefault,
                                        color: Color(0xFFF888888)),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              height: 103,
                              decoration: BoxDecoration(
                                  color: Color(0xFFFF2F5F9),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("${myController.totalOrdersThisMonth}",
                                      style: poppinsSemiBold.copyWith(
                                          fontSize:
                                              Dimensions.fontSizeOverLarge,
                                          color: Colors.black)),
                                  Text(
                                    "Total Orders Month",
                                    style: poppinsRegular.copyWith(
                                        fontSize: Dimensions.fontSizeDefault,
                                        color: Color(0xFFF888888)),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              height: 103,
                              decoration: BoxDecoration(
                                  color: Color(0xFFFF2F5F9),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("${myController.totalOrdersPending}",
                                      style: poppinsSemiBold.copyWith(
                                          fontSize:
                                              Dimensions.fontSizeOverLarge,
                                          color: Colors.black)),
                                  Text(
                                    "Total Orders Pending",
                                    style: poppinsRegular.copyWith(
                                        fontSize: Dimensions.fontSizeDefault,
                                        color: Color(0xFFF888888)),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        bottom: 20,
                        top: MediaQuery.of(context).size.height / 60,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 103,
                              decoration: BoxDecoration(
                                  color: Color(0xFFFF2F5F9),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("2",
                                      style: poppinsSemiBold.copyWith(
                                          fontSize:
                                              Dimensions.fontSizeOverLarge,
                                          color: Colors.black)),
                                  Text(
                                    "Total Reviews",
                                    style: poppinsRegular.copyWith(
                                        fontSize: Dimensions.fontSizeDefault,
                                        color: Color(0xFFF888888)),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              height: 103,
                              decoration: BoxDecoration(
                                  color: Color(0xFFFF2F5F9),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("10 \$",
                                      style: poppinsSemiBold.copyWith(
                                          fontSize:
                                              Dimensions.fontSizeOverLarge,
                                          color: Colors.black)),
                                  Text(
                                    "Total Earning",
                                    style: poppinsRegular.copyWith(
                                        fontSize: Dimensions.fontSizeDefault,
                                        color: Color(0xFFF888888)),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              height: 103,
                              decoration: BoxDecoration(
                                  color: Color(0xFFFF2F5F9),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("${myController.totalOrdersComplete}",
                                      style: poppinsSemiBold.copyWith(
                                          fontSize:
                                              Dimensions.fontSizeOverLarge,
                                          color: Colors.black)),
                                  Text(
                                    "Total Orders Complete",
                                    style: poppinsRegular.copyWith(
                                        fontSize: Dimensions.fontSizeDefault,
                                        color: Color(0xFFF888888)),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}*/
