import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_pharma/util/dimensions.dart';
import 'package:quick_pharma/util/images.dart';
import 'package:quick_pharma/util/styles.dart';

import '../../../util/ColorConstants.dart';


class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.appColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorConstants.appColor,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
          onPressed: (){
            Get.back();
          },
        ),
        title: Text("History",style: poppinsSemiBold.copyWith(fontSize:Dimensions.fontSizeOverLarge,color: Colors.white),),
        actions: [
          IconButton(
            icon: Icon(Icons.logout,color: Colors.white,),
            onPressed: (){},
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                          image: AssetImage(Images.history_icon_new),
                          fit: BoxFit.cover
                      )
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text("John\nWilliam",style:poppinsSemiBold.copyWith(fontSize: Dimensions.fontSizeOverLarge,color: Colors.white),),
                  ),
                ),
                Column(
                  children: [
                    Icon(Icons.star_border,color: Color(0xFFFFFE77B),),
                    Text("4.3",style: poppinsRegular.copyWith(color: Colors.white,fontSize: Dimensions.fontSizeSmall),),
                    SizedBox(height:MediaQuery.of(context).size.height/12,),
                  ],
                )
              ],
            ),
          ),
         Expanded(
           flex: 20,
           child:  Container(
             margin: EdgeInsets.only(top:MediaQuery.of(context).size.height/20),
             width: MediaQuery.of(context).size.width,
             decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
             ),
             child: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/15),
                    child: Row(
                       children: [
                         Expanded(
                           child: Container(
                             margin: EdgeInsets.only(left: 10),
                             width: 169,
                             height: 50,
                             decoration: BoxDecoration(
                               color: Color(0xFFFC7DFCA),
                               borderRadius: BorderRadius.all(Radius.circular(10))
                             ),
                             child: Row(
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.only(left: 30),
                                   child: Image.asset(Images.history_ferma_new),
                                 ),
                                SizedBox(width: MediaQuery.of(context).size.width/50,),
                                Expanded(
                                  flex: 0,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Total Jobs",style:poppinsRegular.copyWith(color: Color(0xFFFF5B705E),fontSize: Dimensions.fontSizeSmall),),
                                      Text("25",style:poppinsRegular.copyWith(color: Colors.black87,fontSize: Dimensions.fontSizeSmall),),
                                    ],
                                  ),
                                )
                               ],
                             ),
                           ),
                         ),
                         SizedBox(width:10,),
                         Expanded(
                           child: Container(
                             margin: EdgeInsets.only(right: 10),
                             width: 169,
                             height: 50,
                             decoration: BoxDecoration(
                                 color: Color(0xFFFC7DFCA),
                                 borderRadius: BorderRadius.all(Radius.circular(10))
                             ),
                             child: Row(
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.only(left: 30),
                                   child: Image.asset(Images.history__new_doller),
                                 ),
                                 SizedBox(width: MediaQuery.of(context).size.width/50,),
                                 Expanded(
                                   flex: 0,
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       Text("Earned",style:poppinsRegular.copyWith(color: Color(0xFFFF5B705E),fontSize: Dimensions.fontSizeSmall),),
                                       Text("3429.78",style:poppinsRegular.copyWith(color: Colors.black87,fontSize: Dimensions.fontSizeSmall),),
                                     ],
                                   ),
                                 )
                               ],
                             ),
                           ),
                         ),
                       ],
                    ),
                  ),
                  SizedBox(height:MediaQuery.of(context).size.height/20),
                  Container(
                    padding: EdgeInsets.only(left: 8,right: 8,top: 8),
                    margin: EdgeInsets.only(left: 10,right: 10),
                    height: 70,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0xFFFC7DFCA),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Column(
                           children: [
                             Text("Progress",style: poppinsRegular.copyWith(color: Color(0xFFF5B705E),fontSize: Dimensions.fontSizeSmall),),
                             SizedBox(height:5 ,),
                             Text("853",style: poppinsMedium.copyWith(color: Colors.black87,fontSize: Dimensions.fontSizeSmall),),
                           ],
                         ),
                         Column(
                           children: [
                             Text("Delivered",style: poppinsRegular.copyWith(color: Color(0xFFF5B705E),fontSize: Dimensions.fontSizeSmall),),
                             SizedBox(height:5 ,),
                             Text("820",style: poppinsMedium.copyWith(color: Colors.black87,fontSize: Dimensions.fontSizeSmall),),
                           ],
                         ),
                         Column(
                           children: [
                             Text("Undelivered",style: poppinsRegular.copyWith(color: Color(0xFFF5B705E),fontSize: Dimensions.fontSizeSmall),),
                             SizedBox(height:5 ,),
                             Text("33",style: poppinsMedium.copyWith(color: Colors.black87,fontSize: Dimensions.fontSizeSmall),),
                           ],
                         ),
                       ],
                    ),
                  )
                ],
             ),
           ),
         )
        ],
      ),
    );
  }
}
