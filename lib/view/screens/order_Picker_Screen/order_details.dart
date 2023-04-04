import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:quick_pharma/main.dart';
import 'package:quick_pharma/util/ColorConstants.dart';
import 'package:quick_pharma/utils/storage_utils.dart';
import 'package:quick_pharma/view/screens/scanner_Screen/update_status.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Wedget/item_widget.dart';
import '../../../controller/order/order_controller.dart';
import '../../../model/orderModel.dart';
import '../scanner_Screen/scanner_Screen.dart';

class OrderDetailsScreen extends StatefulWidget {
  OrderDetailsScreen({Key? key, required this.item}) : super(key: key);
  Orders item;

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.appColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.1,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
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
                    ),
                    Text(
                      'Order Details',
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
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 40,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: ListView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  children: [
                    Container(
                      // height: 1500,
                        decoration: BoxDecoration(
                            color: Color(0xFFF2F5F9),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            orderDetails(
                                mainString: "Recipient Name",
                                subString: widget.item.recipient!.name),
                            orderDetails(
                                mainString: "Recipient Address",
                                subString: widget.item.recipient!.address),
                            orderDetails(
                                mainString: "Recipient Phone",
                                subString: widget.item.recipient!.phone),
                            // orderDetails(
                            //     mainString: "Request Call Upon Arrival",
                            //     subString: widget.item.requestCallUponArrival,
                            //     color: Color(0xFFF66769)),
                            // orderDetails(
                            //     mainString: "Provider Name", subString: ""),
                            orderDetails(
                                mainString: "Total Items",
                                subString: "${(widget.item.items
                                    .toString()
                                    .isEmpty) ? 1 : widget.item.items}"),
                            // orderDetails(
                            //     mainString: "Order's Insurance",
                            //     subString: widget.item.includeInsurance,
                            //     color: Color(0xFF77CFA0)),
                            // orderDetails(
                            //     mainString: "Track Link Opened",
                            //     subString: "No",
                            //     color: Color(0xFFF66769)),
                            orderDetails(
                                mainString: "Delivery Method",
                                subString:
                                "Face-TO-Face Signature Required Signature is required by any person who Lives With the Patient. Driver will take a picture of the patient`s door ",
                                color: Color(0xFF77CFA0)),
                            // orderDetails(
                            //     mainString: "Payout",
                            //     subString: "\$${widget.item.payout}"),
                            orderDetails(
                                mainString: "Copay",
                                subString: "\$${widget.item.copay}"),

                            // orderDetails(
                            //     mainString: "Weight",
                            //     subString: widget.item.weight),

                            // orderDetails(mainString: "Initials", subString: widget.item.),

                            orderDetails(
                                mainString: "Order Type",
                                subString: widget.item.orderType),
                            // orderDetails(
                            //     mainString: "Order Condition",
                            //     subString: widget.item.condition ?? ""),
                            // orderDetails(
                            // mainString: "Current Route", subString: widget.item.r),
                            // orderDetails(
                            //     mainString: "Current Driver",
                            //     subString: widget.item.d),
                            // orderDetails(
                            //     mainString: "Date to Deliver (Prom ETA)",
                            //     subString:
                            //     datTime1(widget.item.dateToDeliver)),
                            // orderDetails(mainString: "ETA", subString: "N/A"),
                            // orderDetails(
                            //     mainString: "Attempts",
                            //     subString: widget.item.attempts.toString()),
                            // orderDetails(
                            //     mainString: "Time Delivered",
                            //     subString: widget.item.timeToDeliver),
                            /* Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      10.0, 10, 20, 10),
                                  child: Text(
                                    "If Not Present, Wrong Address, or Recipient Refused, Call:",
                                    overflow: TextOverflow.clip,
                                    style: TextStyle(
                                        color: Color(0xFFF66769),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Icon(
                                              Icons.phone,
                                              size: 20,
                                            ),
                                          ),
                                          Container(
                                            // width: MediaQuery.of(context).size.width*0.45,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8.0, 10, 20, 10),
                                              child: Text(
                                                "Cell",
                                                overflow: TextOverflow.clip,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 17),
                                              ),
                                            ),
                                          )
                                          // mainText("Cell".toString()),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      ':',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.45,
                                        child: subText(
                                            text: widget.item.isCall,
                                            color: Color(0xFF888888))),
                                  ],
                                ),
                              ],
                            ),*/
                          ],
                        )),

                    SizedBox(
                      height: 12,
                    ),
                    InkWell(
                      onTap: () async {
                        String lat = widget.item.latitude.toString();
                        String lng = widget.item.longitude.toString();
                        String mapUrl = "geo:$lat,$lng";

                        if (await canLaunch(mapUrl)) {
                            await launch(mapUrl);
                          } else {

                          print("could not lunch map");
                            MapsLauncher.launchCoordinates(
                                double.parse(widget.item.latitude.toString()),
                                double.parse(widget.item.longitude.toString()),
                                widget.item.recipient!.name.toString());
                          }
                      },
                      child: Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.08,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            border: Border.all(color: Color(0xFF181A36))),
                        alignment: Alignment.center,
                        child: Text(
                          'Location',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ), SizedBox(
                      height: 18,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(ScannerScreen(back: true,));
                      },
                      child: Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.08,
                        decoration: BoxDecoration(
                          color: ColorConstants.appColor,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'QR Code Scanner',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    InkWell(
                      onTap: () async {
                        StorageUtil.setData(
                            StorageUtil.orderId, widget.item.id);
                        Get.to(OrderStatusPage());
                      },
                      child: Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.08,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            border: Border.all(color: Color(0xFF181A36))),
                        alignment: Alignment.center,
                        child: Text(
                          'Delivery Attempt',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      height: 300,
                      child: GoogleMap(
                        trafficEnabled: true,
                        indoorViewEnabled: true,
                        mapType: MapType.normal,
                        myLocationEnabled: true,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(
                              double.parse(widget.item.latitude.toString()),
                              double.parse(widget.item.longitude.toString())),
                          zoom: 14.4746,
                        ),
                        markers: <Marker> {
                          Marker( //add start location marker
                            markerId: MarkerId("${widget.item.address}"),
                            position: LatLng(
                                double.parse(widget.item.latitude.toString()),
                                double.parse(widget.item.longitude.toString())),
                            //position of marker
                            infoWindow: InfoWindow( //popup info
                              title: 'Car Point ',
                              snippet: 'Car Marker',
                            ),
                          ),},
                        onMapCreated: (GoogleMapController controller) {
                          // _controller.complete(controller);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
