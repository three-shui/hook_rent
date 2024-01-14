import 'package:flutter/material.dart';
import 'package:hook_rent/scoped_model/auth_model.dart';
import 'package:hook_rent/utils/scoped_model_helper.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  //未登录
  Widget _notLoginBuilder(BuildContext context) {
    return Container(
      height: 110,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.green),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage(
                "https://tva1.sinaimg.cn/large/008i3skNgy1gsuh24kjbnj30do0duaad.jpg"),
          ),
          Padding(padding: EdgeInsets.only(right: 15)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed("/login"),
                    child: const Text(
                      "登录",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  const Text(
                    "/",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed("/register"),
                    child: const Text(
                      "注册",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const Text(
                "登录后可以体验更多",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }

  //已登录
  Widget _loginBuilder(BuildContext context) {
    var userInfo = ScopedModelHelper.getModel<AuthModel>(context).userInfo;
    // String userName = (userInfo.nickname != null ? userInfo.nickname! : "nano");
    // // String avatar = userInfo.avatar ??
    // //     "https://tva1.sinaimg.cn/large/008i3skNgy1gsuhtensa6j30lk0li76f.jpg";
    String userName = userInfo.nickname!;
    String avatar = userInfo.avatar!;
    return Container(
      height: 110,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.green),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage(avatar),
          ),
          Padding(padding: EdgeInsets.only(right: 15)),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                //这里显示已登录用户名
                userName,
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              Text(
                "查看编辑个人资料",
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool _isLogin = ScopedModelHelper.getModel<AuthModel>(context).isLogin;
    return _isLogin ? _loginBuilder(context) : _notLoginBuilder(context);
  }
}
