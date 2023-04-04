import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:quick_pharma/controller/earning/earning_controller.dart';
import 'package:quick_pharma/model/earningModel.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../../util/ColorConstants.dart';
import '../../../util/appText.dart';
import '../../../util/dimensions.dart';
import '../../../util/styles.dart';

class EarningScreen extends StatefulWidget {
  const EarningScreen({Key? key}) : super(key: key);

  @override
  State<EarningScreen> createState() => _EarningScreenState();
}

class _EarningScreenState extends State<EarningScreen> {
  final myController = Get.put(EarningController());
  String dropdownvalue = 'Month';
  bool isSelectedCal = false;

  var items = [
    'Month',
    'Week',
  ];

  String currentDate1 = DateFormat("MMM,yyyy").format(DateTime.now());
  String currentDate2 = DateFormat("MMM").format(DateTime.now());
  String currentDate3 = DateFormat("EEE").format(DateTime.now());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myController.searchData(_rangestart, _rangeend);
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
                      AppText.myEarnings,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isSelectedCal = !isSelectedCal;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.calendar_today_outlined,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
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
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: ColorConstants.appColorbg,
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        title: Text(
                          "Total",
                          style: poppinsSemiBold.copyWith(
                              fontSize: Dimensions.fontSizeDefault,
                              color: ColorConstants.earningColor),
                        ),
                        trailing: Text(
                          "0 \$",
                          style: poppinsSemiBold.copyWith(
                              fontSize: Dimensions.fontSizeDefault,
                              color: ColorConstants.appColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () => isSelectedCal
                          ? Container(
                              // height: 1500,
                              child: Column(
                              children: [
                                SfDateRangePicker(
                                  onSelectionChanged: _onSelectionChanged,
                                  selectionMode:
                                      DateRangePickerSelectionMode.range,
                                  maxDate: DateTime.now(),
                                  initialSelectedRange: _selectedDate,
                                ),
                                InkWell(
                                  onTap: () {
                                    print("_selectedDate=> " +

                                        " " +
                                        _dateCount +
                                        " " +
                                        _range +
                                        " " +
                                        _rangeCount);
                                    setState(() {
                                      myController.searchData(
                                          _rangestart, _rangeend);
                                      isSelectedCal = !isSelectedCal;
                                    });
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    decoration: BoxDecoration(
                                      color: ColorConstants.appColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      AppText.apply,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ],
                            ))
                          : ListView.builder(
                              shrinkWrap: true,
                              itemCount: myController.listEarningData.length,
                              physics: ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                Earning item = myController.listEarningData[index];
                                return Column(
                                  children: [
                                    ListTile(
                                      title: Text(
                                        '${(DateFormat("MM/dd/yyyy").format(item.date))}',
                                        style: poppinsSemiBold.copyWith(
                                            fontSize:
                                                Dimensions.fontSizeDefault,
                                            color: ColorConstants.earningColor),
                                      ),
                                      trailing: Text(
                                        "${item.payout} \$",
                                        style: poppinsSemiBold.copyWith(
                                            fontSize:
                                                Dimensions.fontSizeDefault,
                                            color: ColorConstants.appColor),
                                      ),
                                    ),
                                    divider()
                                  ],
                                );
                              }),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  PickerDateRange _selectedDate=PickerDateRange(DateTime.now(),DateTime.now());
  String _dateCount = '';
  String _range = '';
  String  _rangestart =
      '${DateFormat('yyyy-MM-dd').format(DateTime.now())}';
  String _rangeend =
  '${DateFormat('yyyy-MM-dd').format(DateTime.now())}';
  String _rangeCount = '';

  /// The method for [DateRangePickerSelectionChanged] callback, which will be
  /// called whenever a selection changed on the date picker widget.
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    /// The argument value will return the changed date as [DateTime] when the
    /// widget [SfDateRangeSelectionMode] set as single.
    ///
    /// The argument value will return the changed dates as [List<DateTime>]
    /// when the widget [SfDateRangeSelectionMode] set as multiple.
    ///
    /// The argument value will return the changed range as [PickerDateRange]
    /// when the widget [SfDateRangeSelectionMode] set as range.
    ///
    /// The argument value will return the changed ranges as
    /// [List<PickerDateRange] when the widget [SfDateRangeSelectionMode] set as
    /// multi range.
    setState(() {

      if (args.value is PickerDateRange) {
        setState(() {
          _selectedDate = args.value;
          _range = '${DateFormat('yyyy-MM-dd').format(args.value.startDate)} -'
              ' ${DateFormat('yyyy-MM-dd').format(args.value.endDate ?? args.value.startDate)}';
          print(_range.toString());
          _rangestart =
              '${DateFormat('yyyy-MM-dd').format(args.value.startDate)}';
          _rangeend =
              '${DateFormat('yyyy-MM-dd').format(args.value.endDate ?? args.value.startDate)}';
        });
      } else if (args.value is DateTime) {
        setState(() {
          // _selectedDate = args.value.toString();
          _selectedDate = args.value;
          _range = '${DateFormat('yyyy-MM-dd').format(args.value)} -'
              ' ${DateFormat('yyyy-MM-dd').format(args.value)}';
          print(_range.toString());
          _rangestart =
          '${DateFormat('yyyy-MM-dd').format(args.value)}';
          _rangeend =
          '${DateFormat('yyyy-MM-dd').format(args.value)}';
        });

        print(args.value.toString());
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
        print(_dateCount.toString());
      } else {
        _rangeCount = args.value.length.toString();
        print(_rangeCount.toString());
      }
    });
  }

  Widget earningList() {
    return Container(
        // height: 1500,
        decoration: BoxDecoration(
            color: Color(0xFFF2F5F9),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            orderDetails(mainString: "Credit Amount", subString: "10"),
            orderDetails(mainString: "Date", subString: "2022-04-25"),
            orderDetails(mainString: "Time", subString: "09:23:08"),
            orderDetails(mainString: "Invoice", subString: "20784"),
            orderDetails(
                mainString: "Transaction ID",
                subString: "4fd3f34353323d77cd0afbd74061077e"),
          ],
        ));
  }

  Widget orderDetails({String? mainString, String? subString, Color? color}) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            mainText(mainString.toString()),
            Text(
              ':',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w700),
            ),
            subText(
                text: subString.toString(), color: color ?? Color(0xFF888888)),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        divider()
      ],
    );
  }

  Widget mainText(String text) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 10, 12, 10),
        child: Text(
          text,
          overflow: TextOverflow.clip,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 17),
        ),
      ),
    );
  }

  Widget subText({String? text, Color? color}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 10, 12, 10),
        child: Text(
          text.toString(),
          overflow: TextOverflow.clip,
          style: TextStyle(
              color: color ?? Color(0xFF888888),
              fontWeight: FontWeight.w400,
              fontSize: 15),
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
