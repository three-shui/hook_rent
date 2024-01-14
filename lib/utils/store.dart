import 'package:shared_preferences/shared_preferences.dart';

enum StoreKeys {
  token,
  city,
}

class Store {
  final SharedPreferences _store;
  //SharedPreferences是异步的，所以没有办法将其放在构造函数里面，
  //只能写一个静态函数，在静态函数里先拿到异步的prefs，然后再调用构造函数进行初始化Store
  static Future<Store> getInstance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return Store._internal(prefs);
  }

  Store._internal(this._store);

  getString(StoreKeys key) async {
    return _store.get(key.toString());
  }

  setString(StoreKeys key, String value) async {
    return _store.setString(key.toString(), value);
  }

  getStringList(StoreKeys key) async {
    return _store.getStringList(key.toString());
  }

  setStringList(StoreKeys key, List<String> value) async {
    return _store.setStringList(key.toString(), value);
  }
}
