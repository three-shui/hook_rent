import 'package:flutter/material.dart';
import 'package:hook_rent/page/home/tab_search/room_list_item_data.dart';
import 'package:hook_rent/widgets/CommonFloatingActionButton.dart';
import 'package:hook_rent/widgets/room_list_item_widget.dart';

class RoomManage extends StatelessWidget {
  const RoomManage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        floatingActionButton: CommonFloatingActionButton(
            title: "发布房源",
            onTap: () {
              Navigator.of(context).pushNamed("/roomAdd");
            }),
        appBar: AppBar(
          title: const Text("房屋管理"),
          bottom: TabBar(tabs: [
            Text("已租"),
            Text("空置"),
          ]),
        ),
        body: TabBarView(children: [
          ListView(
              children:
                  dataList.map((data) => RoomListItemWidget(data)).toList()),
          ListView(
            children: dataList.map((data) => RoomListItemWidget(data)).toList(),
          )
        ]),
      ),
    );
  }
}
