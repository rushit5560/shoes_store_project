import 'package:shared_preferences/shared_preferences.dart';


class SharedPreferenceData {
  String isLoggedInKey = "isLoggedInKey";

  setUserLoginDetailsInPrefs() async {
SharedPreferences prefs = await SharedPreferences.getInstance();
prefs.setBool(isLoggedInKey, true);
}

}