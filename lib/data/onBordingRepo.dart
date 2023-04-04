import 'package:quick_pharma/util/appText.dart';
import '../model/responce/onBordingModel.dart';
import '../util/images.dart';

class OnBoardingRepo {
  getOnBoardingList() async {
    List<OnBoardingModel> onBoardingList = [
      OnBoardingModel(
          Images.onboard_1, AppText.OnBoradingTitle1, AppText.OnBoradingText1),
      OnBoardingModel(
          Images.onboard_2, AppText.OnBoradingTitle2, AppText.OnBoradingText2),
    ];
    return onBoardingList;
  }
}
