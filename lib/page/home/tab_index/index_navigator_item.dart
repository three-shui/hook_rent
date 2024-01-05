import 'package:flutter/material.dart';

class IndexNavigatorItem {
  String title;
  String imageUrl;
  Function(BuildContext context) onTap;

  IndexNavigatorItem(this.title, this.imageUrl, this.onTap);
}

List<IndexNavigatorItem> items = [
  IndexNavigatorItem("整租", "static/images/home_index_navigator_total.png",
      (BuildContext context) {
    Navigator.pushNamed(context, "/total");
  }),
  IndexNavigatorItem("合租", "static/images/home_index_navigator_share.png",
      (BuildContext context) {
    Navigator.pushNamed(context, "/share");
  }),
  IndexNavigatorItem("地图找房", "static/images/home_index_navigator_map.png",
      (BuildContext context) {
    Navigator.pushNamed(context, "/map");
  }),
  IndexNavigatorItem("出租", "static/images/home_index_navigator_rent.png",
      (BuildContext context) {
    Navigator.pushNamed(context, "/rent");
  })
];
