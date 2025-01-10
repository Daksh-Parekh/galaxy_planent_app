import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:galaxy_planent_app/screens/home/model/planent_model.dart';

class JsonHelper {
  Future<MainModel> planetJsonHelper() async {
    String jsonString = await rootBundle.loadString('assets/json/planent.json');

    var jsonData = await jsonDecode(jsonString);
    MainModel model = MainModel.mapToModel(jsonData);
    log('======================\n$model');

    return model;
  }
}
