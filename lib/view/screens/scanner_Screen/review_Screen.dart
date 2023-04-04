import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:quick_pharma/Wedget/custome_Button/Custome_Button.dart';
import 'package:quick_pharma/util/dimensions.dart';
import 'package:quick_pharma/util/images.dart';
import 'package:quick_pharma/util/styles.dart';

import '../../../util/ColorConstants.dart';



class ReviewScreenNew extends StatefulWidget {
  const ReviewScreenNew({Key? key}) : super(key: key);

  @override
  State<ReviewScreenNew> createState() => _ReviewScreenNewState();
}

class _ReviewScreenNewState extends State<ReviewScreenNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.appColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorConstants.appColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "Rating",
          style: poppinsSemiBold.copyWith(
              fontSize: Dimensions.fontSizeOverLarge, color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.login_rounded,
                color: Colors.white,
              ))
        ],
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      image: DecorationImage(
                          image: AssetImage(
                            Images.new_profile_image,
                          ),
                          fit: BoxFit.fill)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                Text(
                  "John William",
                  style: poppinsSemiBold.copyWith(
                      color: Colors.white,
                      fontSize: Dimensions.fontSizeOverLarge),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 80,
                ),
                Text(
                  "Texas, USA",
                  style: poppinsRegular.copyWith(
                      color: Colors.white, fontSize: Dimensions.fontSizeSmall),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 60,
                ),
                Text(
                  "Quick Pharma",
                  style: poppinsRegular.copyWith(
                      color: Colors.white, fontSize: Dimensions.fontSizeSmall),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 40,
                ),
                RatingBarIndicator(
                  rating: 4,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Color(0xFFFFFE77B),
                  ),
                  itemCount: 5,
                  itemSize: 30.0,
                  direction: Axis.horizontal,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                Divider(
                  indent: MediaQuery.of(context).size.width / 30,
                  endIndent: MediaQuery.of(context).size.width / 5,
                  color: Color(0xFFFC4E0FC),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Text(
                        "Add a tip for John",
                        style: poppinsRegular.copyWith(
                          color: Colors.white,
                          fontSize: Dimensions.fontSizeSmall,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(10),
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(200)),
                          border: Border.all(
                            color: Color(0xFFFFFE77B),
                            width: 1.0,
                          ),
                        ),
                        child: Text(
                          "\$20",
                          style: poppinsRegular.copyWith(
                            color: Colors.white,
                            fontSize: Dimensions.fontSizeSmall,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(10),
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          border: Border.all(
                            color: Color(0xFFFFFE77B),
                            width: 1.0,
                          ),
                        ),
                        child: Text(
                          "\$30",
                          style: poppinsRegular.copyWith(
                            color: Colors.white,
                            fontSize: Dimensions.fontSizeSmall,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(10),
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          border: Border.all(
                            color: Color(0xFFFFFE77B),
                            width: 1.0,
                          ),
                        ),
                        child: Text(
                          "\$40",
                          style: poppinsRegular.copyWith(
                            color: Colors.white,
                            fontSize: Dimensions.fontSizeSmall,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(10),
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          border: Border.all(
                            color: Color(0xFFFFFE77B),
                            width: 1.0,
                          ),
                        ),
                        child: Text(
                          "\$50",
                          style: poppinsRegular.copyWith(
                            color: Colors.white,
                            fontSize: Dimensions.fontSizeSmall,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                Divider(
                  indent: MediaQuery.of(context).size.width / 30,
                  endIndent: MediaQuery.of(context).size.width / 5,
                  color: Color(0xFFFC4E0FC),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Text(
                        "Leave a comment",
                        style: poppinsRegular.copyWith(
                          color: Colors.white,
                          fontSize: Dimensions.fontSizeSmall,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3.9,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xFFFFFE77B),
                      width: 1.0,
                    ),
                  ),
                  child: Text(
                    "Thank you john for fast delivery!",
                    style: poppinsRegular.copyWith(
                      color: Colors.white,
                      fontSize: Dimensions.fontSizeSmall,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomeButton(
                      colors: 0xFFF002501,
                      child: Text(
                        "Submit review".tr,
                        style: poppinsMedium.copyWith(
                            fontSize: 18, color: Color(0xFFFFFE77B)),
                      ),
                      onPress: () {
                        // _updateProfile(userController);
                      }),
                ),
              ],
            ),
          )),
    );
  }
}
