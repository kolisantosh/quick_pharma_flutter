import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../controller/onBordingController.dart';
import '../../../util/ColorConstants.dart';
import '../../../util/dimensions.dart';
import '../../../util/styles.dart';
import '../auth/sign_in_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  bool isLastPage=false;
 final myController=Get.put(OnBoardingController());
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
    return Scaffold(
      backgroundColor:  ColorConstants.appColor,
      body: Obx(() =>  myController.isDataProcessing.value==1?    const Center(
          child: CupertinoActivityIndicator(animating: true,radius: 20,)
      ):PageView.builder(
        itemCount: myController.myList.length,
        itemBuilder:(context,index){
          return Center(
              child: SizedBox(
                  child: Column(children: [
                    Expanded(
                        child:
                        PageView.builder(
                          itemCount: myController.myList.length,
                          controller: _pageController,
                          physics:const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  width:MediaQuery.of(context).size.width,
                                  height:MediaQuery.of(context).size.height/1.6,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(myController.myList[index].imageUrl),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(50),
                                          bottomRight: Radius.circular(50)
                                      )
                                  ),
                                ),
                                SizedBox(height: context.height * 0.025),
                                Text(myController.myList[index].title,style: poppinsSemiBold.copyWith(fontSize:Dimensions.fontSizeExtraSmall,color: Colors.white),textAlign: TextAlign.center,maxLines: 3),
                                SizedBox(height: context.height * 0.025),
                                Text(myController.myList[index].description,style: poppinsSemiBold.copyWith(fontSize:Dimensions.fontSizeSmall,color: Colors.white),textAlign: TextAlign.center,maxLines: 3),
                              ],
                            );
                          },
                          onPageChanged: (index) {
                           setState(() {
                             myController.changeSelectIndex(index);
                           });
                            },
                        )
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      _pageIndicators(myController, context),
                    ),
                    SizedBox(height: context.height * 0.05),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            myController.selectedIndex == 1
                                ? const SizedBox()
                                :
                            Expanded(
                              flex: 0,
                              child: TextButton(
                                child: Text('skip'.tr,style: poppinsSemiBold.copyWith(
                                  color:Colors.white,
                                  fontSize: Dimensions.fontSizeSmall,
                                )
                                ),
                                onPressed: () {
                                  Get.offAll(SignInScreen());
                                },
                              ),
                            ),
                            Expanded(
                              flex: 0,
                              child:InkWell(
                                child: const Padding(
                                  padding: EdgeInsets.only(right: 8),
                                  child: CircleAvatar(
                                    radius: 24,
                                    backgroundColor: Color(0xFFF002501),
                                    child: Icon(
                                      Icons.arrow_forward_sharp,
                                      color: Color(0xFFFFFE77B),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  if (myController.selectedIndex !=
                                      1) {
                                    _pageController.nextPage(
                                        duration: Duration(seconds: 1),
                                        curve: Curves.ease);
                                  } else {
                                      Get.offAll(SignInScreen());
                                  }
                                },
                              ),
                            ),


                          ]
                      ),
                    ),
                  ])));
        }
      ),
      ),
    );
  }
  List<Widget> _pageIndicators(OnBoardingController onBoardingController, BuildContext context) {
    List<Container> indicators = [];

    for (int i = 0; i < onBoardingController.myList.length; i++) {
      print("+++++++onborading");
      print(i);

      indicators.add(
        Container(
          width: 7,
          height: 7,
          margin:const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: i == onBoardingController.selectedIndex
                ? Colors.green
                : Colors.white,
            borderRadius: i == onBoardingController.selectedIndex
                ? BorderRadius.circular(50)
                : BorderRadius.circular(25),
          ),
        ),
      );
    }
    return indicators;
  }
}
