import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_pharma/controller/route/route_controller.dart';
import 'package:quick_pharma/model/orderModel.dart';
import 'package:quick_pharma/util/ColorConstants.dart';
import 'package:quick_pharma/utils/storage_utils.dart';
import 'package:quick_pharma/view/screens/order_Picker_Screen/order_details.dart';
import '../../../Wedget/item_widget.dart';
import '../../../controller/order/order_controller.dart';
import '../../../model/routeModel.dart';

class OrderPickerScreen extends StatefulWidget {
  const OrderPickerScreen({Key? key}) : super(key: key);

  @override
  State<OrderPickerScreen> createState() => _OrderPickerScreenState();
}

class City {
  int cityId;
  String cityName;

  City({required this.cityId, required this.cityName});
}

class CountryState {
  int stateId;
  String stateName;
  List<City> cities;

  CountryState(
      {required this.stateId, required this.stateName, required this.cities});
}

class _OrderPickerScreenState extends State<OrderPickerScreen> {
  TextEditingController editingController = TextEditingController();
  final mycontroller = Get.put(OrderController());
  final myRoutecontroller = Get.put(RouteController());

  @override
  void initState() {
    myRoutecontroller.callGetRoutesApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.appColor,
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
                            "Orders List",
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
                  padding: EdgeInsets.only(top: 25),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: ListView(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: DropdownButtonFormField<int>(
                          decoration: InputDecoration(
                            // border: BorderRadius.circular(10),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              //<-- SEE HERE
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                              //<-- SEE HERE
                              borderRadius: BorderRadius.circular(20),
                              //<-- SEE HERE
                              borderSide:
                                  BorderSide(color: Colors.black, width: 2),
                            ),
                            filled: true,
                            fillColor: ColorConstants.appColor,
                          ),
                          dropdownColor: ColorConstants.appColor,
                          value: myRoutecontroller.id,
                          onChanged: (int? StateId) {
                            myRoutecontroller.id = StateId!;
                            StorageUtil.setData(
                                StorageUtil.regionsId, myRoutecontroller.id);

                            mycontroller.callGetOrdersApi(myRoutecontroller.id);
                          },
                          items: myRoutecontroller.listRouteData
                              .map((Routes state) {
                            return DropdownMenuItem<int>(
                              value: state.id,
                              child: Text(
                                state.routeName,
                                style: TextStyle(color: ColorConstants.white),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      mycontroller.emapty.value == true
                          ? Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              // height: 1500,
                              decoration: BoxDecoration(
                                  color: Color(0xFFF2F5F9),
                                  borderRadius: BorderRadius.circular(10)),

                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "You have no available routes",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17),
                                  ),
                                  Text(
                                    "Contact your dispatcher",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            )
                          : ListView.builder(
                              itemCount: mycontroller.listOrderData.length,
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                Orders item = mycontroller.listOrderData[index];
                      /*          return itemWidget(
                                    ontap: () {
                                      Get.to(OrderDetailsScreen(item: item));
                                    },
                                    item: item,
                                    index: index);*/
                                return Container(
                                    margin: EdgeInsets.all(10),
                                    // height: 1500,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFF2F5F9),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10))),
                                    child: InkWell(
                                      onTap: () async {
                                        var res=await Get.to(OrderDetailsScreen(item: item));
                                        myRoutecontroller.callGetRoutesApi();
                                      },
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 5,
                                          ),
                                          // orderDetails(
                                          //     mainString: "UID",
                                          //     subString: "#${item.id}"),
                                          orderDetails(
                                              mainString: "Status",
                                              subString: item.status),
                                          orderDetails(
                                              mainString: "Pharmacy",
                                              subString: item.client!.name),
                                          orderDetails(
                                              mainString: "Recipient Name",
                                              subString: item.recipient!.name),
                                          orderDetails(
                                              mainString: "Recipient Address",
                                              subString: item.recipient!.address),
                                          // orderDetails(
                                          //     mainString: "Date to Deliver",
                                          //     subString: item.dateToDeliver
                                          //         .toString()),
                                          // orderDetails(
                                          //     mainString: "Time to Deliver",
                                          //     subString: item.timeToDeliver),
                                          // orderDetails(
                                          //     mainString: "Payout",
                                          //     subString: item.payout==null?"\$0":"\$"+item.payout.toString()),
                                          // orderDetails(
                                          //     mainString: "Order Type",
                                          //     subString: item.orderType),
                                        ],
                                      ),
                                    ));
                              }),
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
}
