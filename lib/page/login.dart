import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hook_rent/scoped_model/auth_model.dart';
import 'package:hook_rent/utils/dio_http.dart';
import 'package:hook_rent/utils/scoped_model_helper.dart';
import 'package:hook_rent/utils/store.dart';
import 'package:hook_rent/utils/string_is_null_or_empty.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPassword = true;
  var _usernameController = TextEditingController();
  var _passwordController = TextEditingController();

  _loginHandle() async {
    var username = _usernameController.text;
    var password = _passwordController.text;
    if (stringIsNullOrEmpty(username) || stringIsNullOrEmpty(password)) {
      print("用户名或密码不能为空");
      return;
    }
    const url = "/login";
    var params = {
      "username": username,
      "password": password,
    };
    var res = await DioHttp.of(context).post(url, params);

    if (res.statusCode.toString().startsWith("2")) {
      //这里我在mock的返回数据里面写了个token字段，返回一个固定值
      String token = res.data!["data"]["token"];
      Store store = await Store.getInstance();
      await store.setString(StoreKeys.token, token);
      ScopedModelHelper.getModel<AuthModel>(context).login(token, context);
      //1s之后返回
      Timer(Duration(seconds: 1), () {
        Navigator.of(context).pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(30),
        child: ListView(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: "用户名",
                hintText: "请输入用户名",
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            TextField(
              controller: _passwordController,
              obscureText: _showPassword,
              decoration: InputDecoration(
                labelText: "密码",
                hintText: "请输入密码",
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _showPassword = !_showPassword;
                    });
                  },
                  icon: Icon(
                      _showPassword ? Icons.visibility_off : Icons.visibility),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
              onPressed: () {
                _loginHandle();
              },
              child: Text("登录"),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("还没有账号,"),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "register");
                  },
                  child: Text("去注册~"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
