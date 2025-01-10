import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:galaxy_planent_app/screens/home/model/planent_model.dart';
import 'package:galaxy_planent_app/utils/helper/json_helper.dart';
import 'package:galaxy_planent_app/utils/helper/shr_helper.dart';

class HomeProvider with ChangeNotifier {
  List<Planet> planetList = [];
  List<String> favouritePlanets = [];
  bool isLight = true;

  void solarSystemData() async {
    JsonHelper helper = JsonHelper();
    MainModel sModel = await helper.planetJsonHelper();
    planetList = sModel.solars!.planets ?? [];
    log('$planetList');
    notifyListeners();
  }

  void changeTheme() {
    isLight = !isLight;
    notifyListeners();
  }

  Future<void> saveFavouritePlanet(String planetName) async {
    ShrHelper helper = ShrHelper();
    if (favouritePlanets.contains(planetName)) {
      favouritePlanets.remove(planetName);
    } else {
      favouritePlanets.add(planetName);
    }
    await helper.savePlanentInfo(favouritePlanets);
    notifyListeners();
  }

  Future<void> getFavouritePlanentList() async {
    ShrHelper helper = ShrHelper();
    favouritePlanets = await helper.getPlanentInfo() ?? [];
  }
}
