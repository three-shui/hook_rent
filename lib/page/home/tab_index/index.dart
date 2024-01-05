import 'package:flutter/material.dart';
import 'package:hook_rent/page/home/info/info.dart';
import 'package:hook_rent/page/home/tab_index/index_navigator.dart';
import 'package:hook_rent/widgets/common_swipper.dart';

import 'index_recommend.dart';

class TabIndex extends StatelessWidget {
  const TabIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TabIndex")),
      body: ListView(children: [
        CommonSwipper(),
        IndexNavigator(),
        IndexRecommend(),
        Info()
      ],)

    );
  }
}
