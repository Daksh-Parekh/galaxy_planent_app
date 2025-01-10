import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class ShrHelper {
  Future<void> savePlanentInfo(List<String> planetLists) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('pl', planetLists);
    log('saved');
  }

  Future<List<String>?> getPlanentInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('pl');
  }
}
