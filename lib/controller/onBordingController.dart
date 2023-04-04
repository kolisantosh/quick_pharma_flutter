import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../data/onBordingRepo.dart';
import '../model/responce/onBordingModel.dart';

class OnBoardingController extends GetxController {
  var myList = List<OnBoardingModel>.empty(growable: true).obs;
  var isDataProcessing = false.obs;
  OnBoardingRepo data = OnBoardingRepo();
  int selectedIndex = 0;
  @override
  void onInit() {
    getOnBoardingList();
    changeSelectIndex(0);
    super.onInit();
  }

  void changeSelectIndex(int index) {
    selectedIndex = index;
  }

  getOnBoardingList() {
    print("++++++");
    print(myList.length);
    isDataProcessing.value = true;
    data.getOnBoardingList().then((value) {
      isDataProcessing.value = false;
      myList.clear();
      myList.addAll(value);
      print(myList.length);
    }, onError: (err) {
      isDataProcessing.value = false;
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
