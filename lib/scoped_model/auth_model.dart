import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hook_rent/models/user_info.dart';
import 'package:hook_rent/utils/dio_http.dart';
import 'package:hook_rent/utils/store.dart';
import 'package:hook_rent/utils/string_is_null_or_empty.dart';
import 'package:scoped_model/scoped_model.dart';

class AuthModel extends Model {
  String _token = "";
  UserInfo? _userInfo;

  UserInfo get userInfo => _userInfo!;

  String get token => _token;

  bool get isLogin => _token is String && _token != "";

  void initApp(BuildContext context) async {
    Store store = await Store.getInstance();
    String token = await store.getString(StoreKeys.token);
    if (!stringIsNullOrEmpty(token)) {
      login(token, context);
    }
  }

  _getUserInfo(BuildContext context) async {
    const url = "/user";
    var res = await DioHttp.of(context).get(url, null, _token);
    var resMap = json.decode(res.toString());
    var userInfo = UserInfo.fromJson(resMap["data"]);
    print("******${resMap['data']}");
    _userInfo = userInfo;
    notifyListeners();
  }

  void login(String token, BuildContext context) {
    _token = token;
    notifyListeners();
    _getUserInfo(context);
  }

  void logout() {
    _token = "";
    _userInfo = null;
    notifyListeners();
  }
}
