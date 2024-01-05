import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _showPassword = false;
  bool _showAgainPassword = false;

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
              decoration: InputDecoration(labelText: "用户名", hintText: "请输入用户名"),
            ),
            Padding(padding: EdgeInsets.all(10)),
            TextField(
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
                  icon: Icon(
                      _showAgainPassword ? Icons.visibility_off : Icons.visibility),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
              onPressed: () {
                //TODO
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
