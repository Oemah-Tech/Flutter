import 'package:lan_lan/src/utils/constants/con_key.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ComPrefs {
  // Get SP init - START ------------------------------------------------------
  static Future<bool> getInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool(ConKey.kInit) ?? false;
  }
  // Get SP init - END --------------------------------------------------------

  // Set SP init - START ------------------------------------------------------
  static Future<bool> setInit(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setBool(ConKey.kInit, value);
  }
  // Set SP init - END --------------------------------------------------------

  // Get SP onBoarding - START ------------------------------------------------
  static Future<bool> getOnBoarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool(ConKey.kOnBoarding) ?? false;
  }
  // Get SP onBoarding - END --------------------------------------------------

  // Set SP onBoarding - START ------------------------------------------------
  static Future<bool> setOnBoarding(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.setBool(ConKey.kOnBoarding, value);
  }
  // Set SP onBoarding - END --------------------------------------------------
}
