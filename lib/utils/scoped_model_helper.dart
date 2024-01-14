import 'package:flutter/material.dart';
import 'package:hook_rent/config.dart';
import 'package:hook_rent/scoped_model/city_model.dart';
import 'package:scoped_model/scoped_model.dart';

class ScopedModelHelper {
  static T getModel<T extends Model>(BuildContext context) {
    return ScopedModel.of<T>(context, rebuildOnChange: true);
  }

  static String getAreaId(context) {
    return ScopedModelHelper.getModel<CityModel>(context).city?.id ??
        Config.availableCitys.first.id;
  }
}
