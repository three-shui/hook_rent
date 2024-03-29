import 'package:fluro/fluro.dart';
import 'package:hook_rent/page/home/homepage.dart';
import 'package:hook_rent/page/login.dart';
import 'package:hook_rent/page/not_found.dart';
import 'package:hook_rent/page/register.dart';
import 'package:hook_rent/page/room_add/room_add.dart';
import 'package:hook_rent/page/room_detail/room_detail.dart';
import 'package:hook_rent/page/room_manage/room_manage.dart';
import 'package:hook_rent/page/settings.dart';

class Routes {
  //1.定义路由名称
  static String home = "/";
  static String login = "/login";
  static String register = "/register";
  static String roomDetail = "/roomDetail/:roomId";
  static String settings = "/settings";
  static String roomManage = "/roomManage";
  static String roomAdd = "/roomAdd";

  //2.定义路由跳转页面
  //home
  static var _homeHandler = Handler(handlerFunc: (_, __) {
    return HomePage();
  });

  //login
  static var _loginHandler = Handler(handlerFunc: (_, __) {
    return LoginPage();
  });

  //register
  static var _registerHandler = Handler(handlerFunc: (_, __) {
    return RegisterPage();
  });

  //not_found
  static var _notFoundHandler = Handler(handlerFunc: (_, __) {
    return NotFoundPage();
  });

  //roomDetail
  static var _roomDetailHandler = Handler(handlerFunc: (_, params) {
    return RoomDetailPage(
      roomId: params["roomId"]![0],
    );
  });

  // settings
  static var _settingsHandler = Handler(handlerFunc: (_, __) {
    return Settings();
  });

  // roomManage
  static var _roomManageHandler = Handler(handlerFunc: (_, __) {
    return RoomManage();
  });

  // roomAdd
  static var _roomAddHandler = Handler(handlerFunc: (_, __) {
    return RoomAdd();
  });

  //3.编写函数,关联路由名称和处理函数
  static void defineRoutes(FluroRouter router) {
    router.define(home, handler: _homeHandler);
    router.define(login, handler: _loginHandler);
    router.define(register, handler: _registerHandler);
    router.notFoundHandler = _notFoundHandler;
    router.define(roomDetail, handler: _roomDetailHandler);
    router.define(settings, handler: _settingsHandler);
    router.define(roomManage, handler: _roomManageHandler);
    router.define(roomAdd, handler: _roomAddHandler);
  }
}
