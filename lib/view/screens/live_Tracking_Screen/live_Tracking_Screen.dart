import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:quick_pharma/util/images.dart';
import 'package:quick_pharma/util/styles.dart';

import '../../../util/ColorConstants.dart';


class LiveTrackingScreen extends StatefulWidget {
  const LiveTrackingScreen({Key? key}) : super(key: key);

  @override
  State<LiveTrackingScreen> createState() => _LiveTrackingScreenState();
}

class _LiveTrackingScreenState extends State<LiveTrackingScreen> {
  static double long = 72.78544617509903, lat = 21.1869283;
  Completer<GoogleMapController> _controller = Completer();
  bool userMood = true;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(lat, long),
    zoom: 14.4746,
  );
  late BitmapDescriptor myIcon;
  @override
  @override
  void initState() {
    super.initState();
    setMarker();
    determinePosition();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              trafficEnabled: true,
              indoorViewEnabled: true,
              mapType: userMood ? MapType.normal : MapType.satellite,
              markers: _markers,
              myLocationEnabled: true,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            Container(
              margin: EdgeInsets.only(top:MediaQuery.of(context).size.height/2.3,left: 10,right: 10),
              width: MediaQuery.of(context).size.width,
              height:  89,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 20,
                  backgroundImage:AssetImage(Images.new_profile_image,),
                ),
                title: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("John William"),
                    Text("36.30"),
                    Row(
                      children: [
                        Icon(Icons.star_border,color: Color(0xFFFFFE77B),),
                        Text("4.3"),
                      ],
                    ),
                  ],
                ),
                trailing:IconButton(
                  icon:const Icon(Icons.phone_in_talk_rounded,color: Colors.black,),
                  onPressed: ()async{
                      const number = '6204235545';
                      bool? res = await FlutterPhoneDirectCaller.callNumber(number);
                  },
                ),
              ),
            ),
            SizedBox(height:MediaQuery.of(context).size.width/30,),
            Positioned(
              top: MediaQuery.of(context).size.height/1.7,
              child:Container(
                alignment: Alignment.bottomCenter,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration:const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                ),
                child: Column(
                  children: [
                    Container(
                      margin:const EdgeInsets.only(left: 20,right: 20,top: 40),
                      width: MediaQuery.of(context).size.width,
                      height: 175,
                      decoration:const BoxDecoration(
                        color: Color(0xFFFC7DFCA),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      child: ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("#10716198",style: poppinsMedium.copyWith(color: Colors.black87,fontSize: 16),),
                                Container(
                                  alignment: Alignment.center,
                                  width: 83,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                    color: ColorConstants.appColor,
                                  ),
                                  child: Text("Delivered",style:poppinsRegular.copyWith(fontSize: 12,color: Colors.white),),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                            child: Row(
                              children: [
                                Text("10/09/2020",style: poppinsMedium.copyWith(color: Colors.black87,fontSize: 16),),
                                SizedBox(width: 8,),
                                Text("13:40",style:poppinsRegular.copyWith(fontSize: 16,color: Colors.black87),),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10,top: 10),
                            child:Row(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Column(
                                    children: [
                                      Image.asset(Images.new_circle),
                                      Image.asset(Images.new_line),
                                      Image.asset(Images.new_circle),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 8,),
                                Column(
                                  children: [
                                    Text("NYC, Admire Pr. 1A, 4020",style: poppinsMedium.copyWith(fontSize: 14,color: Color(0xFFF5B705E)),),
                                    Text("3.30",style: poppinsMedium.copyWith(color: Colors.black87,fontSize: 16,),textAlign: TextAlign.end,),
                                    Text("NYC, Gogrine Pr. 1A, 4020",style: poppinsMedium.copyWith(fontSize: 14,color: Color(0xFFF5B705E)),),
                                  ],
                                )
                              ],
                            )
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
  Set<Marker> _markers = Set.of([]);
  void setMarker() async {
    Uint8List destinationImageData = await convertAssetToUnit8List(Images.location_marker, width: 50,);
    _markers = Set.of([]);
    _markers.add(Marker(
      markerId: MarkerId("$lat" + "$long"),
      infoWindow: InfoWindow(title: "Google Plex"),
      position: LatLng(lat, long),
      icon: BitmapDescriptor.fromBytes(destinationImageData),
    ));

    setState(() {});
  }
  Future<Uint8List> convertAssetToUnit8List(String imagePath, {int width = 50}) async {
    ByteData data = await rootBundle.load(imagePath);
    Codec codec = await instantiateImageCodec(data.buffer.asUint8List(), targetWidth: width);
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png))!.buffer.asUint8List();
  }
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {}
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {}
    }

    if (permission == LocationPermission.deniedForever) {}

    return await Geolocator.getCurrentPosition();
  }
}



