import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hook_rent/utils/dio_http.dart';
import 'package:hook_rent/utils/string_is_null_or_empty.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _showPassword = true;
  bool _showAgainPassword = true;
  var _usernameController = TextEditingController();
  var _passwordController = TextEditingController();
  var _repeatPasswordController = TextEditingController();

  _registerHandler() async {
    var _username = _usernameController.text;
    var _password = _passwordController.text;
    var _repeatPassword = _repeatPasswordController.text;
    if (_password != _repeatPassword) {
      print("两次输入密码不一致");
      return;
    }
    if (stringIsNullOrEmpty(_username) || stringIsNullOrEmpty(_password)) {
      print("用户名或密码不能为空");
      return;
    }

    const url = "/register";
    var params = {"username": _username, "password": _password};
    var res = await DioHttp.of(context).post(url, params);
    print(res.data);
    if (res.statusCode == 200) {
      Navigator.of(context).pushReplacementNamed("/login");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("注册"),
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
            TextField(
              controller: _repeatPasswordController,
              obscureText: _showAgainPassword,
              decoration: InputDecoration(
                labelText: "确认密码",
                hintText: "请再次输入密码",
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _showAgainPassword = !_showAgainPassword;
                    });
                  },
                  icon: Icon(_showAgainPassword
                      ? Icons.visibility_off
                      : Icons.visibility),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
              onPressed: () {
                _registerHandler();
              },
              child: Text("注册"),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("已有账号,"),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, "login");
                  },
                  child: Text("去登录~"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
