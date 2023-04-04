import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_pharma/controller/profile/profile_controller.dart';
import 'package:quick_pharma/view/screens/dashboard_screen/dashBoardScreen.dart';
import 'package:quick_pharma/view/screens/order_Picker_Screen/order_Picker_Screen.dart';
import 'package:quick_pharma/view/screens/profile_Screen/profile_screen.dart';
import 'package:quick_pharma/view/screens/scanner_Screen/scanner_Screen.dart';
import '../../../util/ColorConstants.dart';

class HomePageView extends StatefulWidget {
  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  int _selectedIndex = 0;
  final myController = Get.put(ProfileController());

  static List<Widget> _widgetOptions = <Widget>[
    DashBoardScreen(),
    OrderPickerScreen(),
    ScannerScreen(),
    ProfileScreen(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset("assets/image/HomeIcon.png",color: _selectedIndex==0?ColorConstants.appColor:Colors.grey),
            label: 'Home',
            // backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Image.asset("assets/image/orderListIcon.png",color: _selectedIndex==1?ColorConstants.appColor:Colors.grey),
            label: 'Orders List',
            // backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon:Image.asset("assets/image/scannerIcon.png",color: _selectedIndex==2?ColorConstants.appColor:Colors.grey),
            label: 'QR Scanner',
            // backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/image/profileIcon.png',color: _selectedIndex==3?ColorConstants.appColor:Colors.grey),
            label: 'Profile',
            // backgroundColor: Colors.pink,
          ),
        ],
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        selectedItemColor: ColorConstants.appColor,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      // bottomNavigationBar: Container(
      //   // margin: EdgeInsets.only(bottom: 30,right: 10,left: 10),
      //   // decoration: BoxDecoration(
      //   //     color: ColorConstants.appColor,
      //   //     borderRadius: BorderRadius.all(Radius.circular(30))
      //   // ),
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
      //     child: GNav(
      //       rippleColor: ColorConstants.appColor,
      //       hoverColor: ColorConstants.appColor,
      //       gap: 8,
      //       activeColor: Color(0xFFFFFE77B),
      //       iconSize: 24,
      //       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      //       duration: Duration(milliseconds: 400),
      //       tabBackgroundColor: ColorConstants.appColor,
      //       color: Colors.white,
      //       tabs: [
      //         GButton(
      //           icon: Icons.account_circle_outlined,
      //           text: 'User',
      //         ),
      //         GButton(
      //           icon: Icons.alt_route_outlined,
      //           text: 'Map',
      //         ),
      //         GButton(
      //           icon: Icons.diamond,
      //           text: 'Rout',
      //         ),
      //         GButton(
      //           icon: LineIcons.home,
      //           text: 'Home',
      //         ),
      //       ],
      //       selectedIndex: _selectedIndex,
      //       onTabChange: (index) {
      //         setState(() {
      //           _selectedIndex = index;
      //         });
      //       },
      //     ),
      //   ),
      // ),
    );
  }
}
