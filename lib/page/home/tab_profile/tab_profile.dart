import 'package:flutter/material.dart';
import 'package:hook_rent/page/home/info/info.dart';
import 'package:hook_rent/page/home/tab_profile/advertisement.dart';
import 'package:hook_rent/page/home/tab_profile/function_button.dart';

import 'header.dart';

class TabProfile extends StatelessWidget {
  const TabProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的"),
        elevation: 0.8,
      ),
      body: ListView(
        children: [
          Header(),
          FunctionButton(),
          Advertisement(),
          Info(true),
        ],
      ),
    );
  }
}
