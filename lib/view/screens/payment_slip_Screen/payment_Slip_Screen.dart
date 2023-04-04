import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_pharma/Wedget/custome_Button/Custome_Button.dart';
import 'package:quick_pharma/util/dimensions.dart';
import 'package:quick_pharma/util/images.dart';
import 'package:quick_pharma/util/styles.dart';

import '../../../util/ColorConstants.dart';

class PaymentSlipScreen extends StatefulWidget {
  const PaymentSlipScreen({Key? key}) : super(key: key);

  @override
  State<PaymentSlipScreen> createState() => _PaymentSlipScreenState();
}

class _PaymentSlipScreenState extends State<PaymentSlipScreen> {
  @override
  Widget build(BuildContext context) {
    double size=MediaQuery.of(context).size.height/2.9;
    return Scaffold(
      backgroundColor: ColorConstants.appColor,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Get.back();
          },
        ),
        title: Text("Invoice"),
        centerTitle: true,
        backgroundColor: ColorConstants.appColor,
        actions: [
          IconButton(
            icon: Icon(Icons.settings_outlined),
            onPressed: (){
              print(size);
            },
          )
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage:AssetImage(Images.new_profile_image,),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("John William",style:poppinsMedium.copyWith(color: Colors.white,fontSize: 16),),
                Text("John.william@gmail.com",style:poppinsMedium.copyWith(color: Colors.white,fontSize: 14),),
              ],
            ),
            trailing:Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("4",style:poppinsMedium.copyWith(color: Colors.white,fontSize: 14),),
                IconButton(
                  icon: Icon(Icons.star_border,color: Color(0xFFFFFE77B),),
                  onPressed: (){},
                ),
              ],
            )
          ),
          SizedBox(height: MediaQuery.of(context).size.height/20,),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text("Details",style:poppinsMedium.copyWith(color: Colors.white,fontSize: 16),),
          ),
          Container(
            padding: EdgeInsets.only(left: 8,right: 8),
            height: 80,
            margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/50,right:MediaQuery.of(context).size.width/50,top: MediaQuery.of(context).size.height/50 ),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0xFFFC7DFCA),
              borderRadius: BorderRadius.all(Radius.circular(10))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("#10716198",style: poppinsRegular.copyWith(color: Colors.black87,fontSize: 16),),
                    Text("Hellen Archar",style: poppinsMedium.copyWith(color: Colors.black,fontSize: 16),),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("E-Sign",style: poppinsRegular.copyWith(color: Colors.black87,fontSize: 16),),
                     Container(
                       margin: EdgeInsets.only(top: 5),
                       width: 121,
                       height: 23,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.all(Radius.circular(10)),
                         border: Border.all(
                           color: ColorConstants.appColor,
                           width: 1, //                   <--- border width here
                         ),
                       ),
                     )
                  ],
                )
              ],
            ),
          ),
         SizedBox(height: 15,),
         Padding(
           padding: const EdgeInsets.only(left: 20),
           child: Column(
             children: [
               Row(
                 children: [
                   Image.asset(Images.send_new),
                   SizedBox(width: 8,),
                   Text("Pickup",style: poppinsMedium.copyWith(fontSize: 16,color: Colors.white),)
                 ],
               ),
               SizedBox(height: 10,),
               Text("ARX Compuding Pharamacy, JamaicaNY 11435, USA",style: poppinsMedium.copyWith(fontSize: 16,color: Colors.white),),
               SizedBox(height: 10,),
               Row(
                 children: [
                   Image.asset(Images.new_location,),
                   SizedBox(width: 8,),
                   Text("Drop point",style: poppinsMedium.copyWith(fontSize: 16,color: Colors.white),)
                 ],
               ),
               SizedBox(height: 10,),
               Text("1440 Queens Blvd, Downtown, NY 11435,\nUSA",style: poppinsMedium.copyWith(fontSize: 16,color: Colors.white),),
               SizedBox(height: 10,),
             ],
           ),
         ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("TOTAL SUMMERY",style: poppinsMedium.copyWith(fontSize: 16,color: Colors.white),),
          ),
          Container(
             width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 10,right: 10,top: 20),
            height: size,
            decoration: BoxDecoration(
               borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Color(0xFFFFC7DFCA)
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Text("Amount",style:poppinsRegular.copyWith(fontSize: 16,color: Colors.black87),),
                  trailing: Text("\$50",style: poppinsMedium.copyWith(color: Colors.black87,fontSize: 16),),
                ),
                ListTile(
                  leading: Text("Express Delivery",style:poppinsRegular.copyWith(fontSize: 16,color: Colors.black87),),
                  trailing: Text("\$10",style: poppinsMedium.copyWith(color: Colors.black87,fontSize: 16),),
                ),
                ListTile(
                  leading: Text("Tax and Service Charges",style:poppinsRegular.copyWith(fontSize: 16,color: Colors.black87),),
                  trailing: Text("\$16.21",style: poppinsMedium.copyWith(color: Colors.black87,fontSize: 16),),
                ),
                ListTile(
                  leading: Text("Total",style:poppinsRegular.copyWith(fontSize: 16,color: Colors.black87),),
                  trailing: Text("\$76.21",style: poppinsMedium.copyWith(color: Colors.black87,fontSize: 16),),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CustomeButton(
              colors:0xFFF002501,
              child: Text("Get PDF Receipt",style: poppinsMedium.copyWith(fontSize: Dimensions.fontSizeSmall,color: Color(0xFFFFFE77B)),),
              onPress: (){
                Get.to(PaymentSlipScreen());
              },
            ),
          )
        ],
      ),
    );
  }
}
