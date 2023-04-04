import '../model/responce/language_model.dart';

class AppConstants{
  static const String APP_NAME = 'Quick Pharma';

  //key
  static const String THEME = 'quick_pharma';
  static List<LanguageModel> languages = [
    LanguageModel( languageName: 'English', countryCode: 'US', languageCode: 'en'),
    LanguageModel( languageName: 'عربى', countryCode: 'SA', languageCode: 'ar'),
  ];

  //save local Data
  static int userId = 0;
  static String userName = "";
  static String userMobile = "";
  static String userEmail = "";
  static String userLoc = "";
  static String userUnm = "";
  static String userProfileImage = "";


}