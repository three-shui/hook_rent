import 'package:flutter/material.dart';
import 'package:hook_rent/page/home/info/info.dart';
import 'package:hook_rent/page/home/tab_index/index_navigator.dart';
import 'package:hook_rent/widgets/common_swipper.dart';
import 'package:hook_rent/widgets/search_bar/search_bar.dart';

import 'index_recommend.dart';

class TabIndex extends StatelessWidget {
  const TabIndex({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: SearchBar(
            showLocation: true,
            showMap: true,
            onSearch: () {
              Navigator.of(context).pushNamed("/search");
            },
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView(
          children: [
            CommonSwipper(),
            IndexNavigator(),
            IndexRecommend(),
            Info(true),
          ],
        ));
  }
}
