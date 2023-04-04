import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_pharma/Wedget/custome_Button/Custome_Button.dart';
import 'package:quick_pharma/util/dimensions.dart';
import 'package:quick_pharma/util/images.dart';
import 'package:quick_pharma/util/styles.dart';
import 'package:quick_pharma/view/screens/payment_Screen/payment_Screen.dart';

import '../../../util/ColorConstants.dart';


class RouteDetailsScreen extends StatefulWidget {
  const RouteDetailsScreen({Key? key}) : super(key: key);

  @override
  State<RouteDetailsScreen> createState() => _RouteDetailsScreenState();
}

class _RouteDetailsScreenState extends State<RouteDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.appColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorConstants.appColor,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 20,
            backgroundImage:AssetImage(Images.new_profile_image,) ,
          ),
        ),
        title: Text("08/11/2020\n   11:17 am",style: TextStyle(fontSize: 16),),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: (){},
              icon: Icon(Icons.phone_in_talk_rounded,color: Colors.white,),
            )
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10,top: 5),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Track Your Shipment",style: poppinsSemiBold.copyWith(fontSize: Dimensions.fontSizeExtraSmall,color: Colors.white),)
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height/30,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(100))
                  ),
                  child: TextFormField(
                    textInputAction: TextInputAction.search,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        filled: true,
                        fillColor: Colors.white,
                        hintStyle: TextStyle(color: Colors.black,fontSize: 16),
                        hintText: "Enter Your Shipment Number",
                        prefixIcon: Image.asset(Images.search_Normal),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: BorderSide.none)
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height/40,),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 25),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
              ),
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10,right: 10),
                    width: MediaQuery.of(context).size.width,
                    height: 125,
                    decoration: BoxDecoration(
                        color: Color(0xFFFC7DFCA),
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Column(
                      children: [
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Padding(
                             padding: const EdgeInsets.only(left: 8,),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Row(
                                   children: [
                                     Text("Track Order",style:poppinsMedium.copyWith(fontSize: Dimensions.fontSizeExtraSmall,color: Colors.black,),),
                                   ],
                                 ),
                                 SizedBox(height: 10,),
                                 Text("Will Watson",style: poppinsRegular.copyWith(fontSize: 16,color: Colors.black),),
                                 Text("#10632000",style: poppinsRegular.copyWith(fontSize: 16,color: Colors.black),),
                               ],
                             ),
                           ),
                           Container(
                             alignment: Alignment.center,
                             margin: EdgeInsets.all(10),
                             height: 100,
                             width: 80,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.all(Radius.circular(10)),
                                 image: DecorationImage(
                                     image: AssetImage(Images.map_image),
                                     fit: BoxFit.cover
                                 )
                             ),
                             child: Icon(Icons.location_on_rounded),
                           )
                         ],
                       )
                      ],
                    ),
                 ),
                  SizedBox(height: MediaQuery.of(context).size.height/60,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("All",style: poppinsMedium.copyWith(fontSize: 16,color: Colors.black),),
                        Text("Delivering ",style: poppinsMedium.copyWith(fontSize: 16,color: Color(0xFFFC7DFCA)),),
                        Text("Received",style: poppinsMedium.copyWith(fontSize: 16,color: Color(0xFFFC7DFCA)),),
                        Text("See All",style: poppinsMedium.copyWith(fontSize: 16,color: Color(0xFFF77CFA0)),),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.black,
                         borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Image.asset(Images.new_way),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Dolo Paracetamol 500mg",style: poppinsBold.copyWith(fontSize: Dimensions.fontSizeSmall,color: Colors.black),),
                        Text("#10632000",style: poppinsBold.copyWith(fontSize: Dimensions.fontSizeSmall,color: Colors.black),),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  ListTile(
                    leading: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.black,
                         borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: Image.asset(Images.arrow_new),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Receiver ",style: poppinsBold.copyWith(fontSize: Dimensions.fontSizeSmall,color: Colors.black),),
                        Text("HELEN ARCHAR",style: poppinsBold.copyWith(fontSize: Dimensions.fontSizeSmall,color: Colors.black),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Column(
                           children: [
                             Text("Route",style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSmall,color: Colors.black),),
                             Text("21 Stop",style: poppinsSemiBold.copyWith(fontSize: Dimensions.fontSizeSmall,color: Colors.black),)
                           ],
                         ),
                         Column(
                           children: [
                             Text("Time",style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSmall,color: Colors.black),),
                             Text("3 hours",style: poppinsSemiBold.copyWith(fontSize: Dimensions.fontSizeSmall,color: Colors.black),)
                           ],
                         ),
                         Column(
                           children: [
                             Text("Rates",style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSmall,color: Colors.black),),
                             Text("85.80",style: poppinsSemiBold.copyWith(fontSize: Dimensions.fontSizeSmall,color: Colors.black),)
                           ],
                         ),
                       ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height/30,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomeButton(
                      child: Text("Order Now",style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSmall,color: Colors.white),),
                      onPress: (){
                        Get.to(PaymentScreenNew());
                      },
                    ),
                  )
                ],
              )
            ),
          )
        ],
      ),
    );
  }
}
