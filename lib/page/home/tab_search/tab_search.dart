import 'package:flutter/material.dart';
import 'package:hook_rent/page/home/tab_search/filter_bar/filter_drawer.dart';
import 'package:hook_rent/page/home/tab_search/room_list_item_data.dart';
import 'package:hook_rent/widgets/room_list_item_widget.dart';
import 'package:hook_rent/widgets/search_bar/search_bar.dart';

import 'filter_bar/filter_bar.dart';

class TabSearch extends StatefulWidget {
  const TabSearch({Key? key}) : super(key: key);

  @override
  State<TabSearch> createState() => _TabSearchState();
}

class _TabSearchState extends State<TabSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: FilterDrawer(),
      appBar: AppBar(
        //将actions设为空，去掉endDrawer默认的右上角三条杠的图标
        actions: [Container()],
        elevation: 0,
        title: SearchBar(
          showLocation: true,
          showMap: true,
          onSearch: () {
            Navigator.of(context).pushNamed("/search");
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
              child: FilterBar(
            onChange: (data) {},
          )),
          Expanded(
            child: ListView(
              children:
                  dataList.map((data) => RoomListItemWidget(data)).toList(),
            ),
          )
        ],
      ),
    );
  }
}
