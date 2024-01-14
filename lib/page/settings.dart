import 'package:flutter/material.dart';
import 'package:hook_rent/scoped_model/auth_model.dart';
import 'package:hook_rent/utils/scoped_model_helper.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("settings"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            //这里因为我使用fluttertoast时总是报错，大概意思就是gradle的jdk版本不匹配
            //弄了好久还是弄不好，于是就改成了这种弹窗的方式
            //而且感觉这种弹窗的方式更符合日常的App
            await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("EXIT"),
                    content: Text("Are you sure you want to exit?"),
                    actions: [
                      //取消按钮
                      TextButton(
                          onPressed: () {
                            //关闭，无返回值
                            Navigator.of(context).pop();
                          },
                          child: Text("Cancel")),
                      //确认按钮
                      TextButton(
                          onPressed: () {
                            //关闭，返回值为true
                            ScopedModelHelper.getModel<AuthModel>(context).logout();
                            Navigator.of(context).pop(true);
                          },
                          child: Text(
                            "Confirm",
                            style: TextStyle(color: Colors.red),
                          )),
                    ],
                  );
                });
          },
          child: Text('退出登录'),
        ),
      ),
    );
  }
}
