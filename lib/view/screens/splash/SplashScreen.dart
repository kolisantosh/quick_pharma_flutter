import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../util/ColorConstants.dart';
import '../../../util/dimensions.dart';
import '../../../util/images.dart';
import '../../../util/styles.dart';
import 'package:get/get.dart';

import '../onBoarding/onBoardingScreen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Duration du=Duration(seconds: 3);
    Timer(du, () {
      Get.offAll(OnBoardingScreen());
    });
  }
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.appColor,
      key: _globalKey,
      body: Center(
          child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 15,
          ),
          Expanded(
            flex: 0,
            child: Text(
              "Quick Pharma",
              style: poppinsMedium.copyWith(
                  fontSize: Dimensions.fontSizeLarge,
                  color: Color(0xFFFFFE77B)),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 15,
          ),
          Expanded(
            flex: 0,
            child: Text(
              "Stop Paying too\nmuch for your",
              style: poppinsBold.copyWith(
                fontSize: Dimensions.fontSizeLarge,
                color: Color(0xFFFFFFFFF),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 0,
            child: Text(
              "Prescriptions",
              style: poppinsBold.copyWith(
                fontSize: Dimensions.fontSizeOverLarge,
                color: Color(0xFFF77CFA0),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 50,
          ),
          Expanded(
            flex: 0,
            child: Text(
              "Quick Pharma",
              style: poppinsRegular.copyWith(
                fontSize: Dimensions.fontSizeSmall,
                color: Color(0xFFF77CFA0),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 50,
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Image.asset(
                Images.splash_logo,
                height: 358,
                width: 362,
              ),
            ),
          ),
          Expanded(flex: 0, child: Container())
        ],
      )),
      floatingActionButton: InkWell(
        onTap: () {
          //Get.to(OnBoardingScreen());
        },
        child: CircleAvatar(
          radius: 24,
          backgroundColor: Color(0xFFF002501),
          child: Icon(
            Icons.arrow_forward_sharp,
            color: Color(0xFFFFFE77B),
          ),
        ),
      ),
    );
  }
}
