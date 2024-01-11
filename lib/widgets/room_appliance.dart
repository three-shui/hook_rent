import 'package:flutter/material.dart';
import 'package:hook_rent/config.dart';
import 'CommonCheckButton.dart';

class RoomApplianceItem {
  final String title;
  final int iconPoint;
  final bool isChecked;

  const RoomApplianceItem(this.title, this.iconPoint, this.isChecked);
}

const List<RoomApplianceItem> _dataList = [
  RoomApplianceItem('衣柜', 0xe918, false),
  RoomApplianceItem('洗衣机', 0xe917, false),
  RoomApplianceItem('空调', 0xe90d, false),
  RoomApplianceItem('天然气', 0xe90f, false),
  RoomApplianceItem('冰箱', 0xe907, false),
  RoomApplianceItem('暖气', 0xe910, false),
  RoomApplianceItem('电视', 0xe908, false),
  RoomApplianceItem('热水器', 0xe912, false),
  RoomApplianceItem('宽带', 0xe90e, false),
  RoomApplianceItem('沙发', 0xe913, false),
];

class RoomAppliance extends StatefulWidget {
  final ValueChanged<List<RoomApplianceItem>> onChange;

  const RoomAppliance({required this.onChange, Key? key}) : super(key: key);

  @override
  State<RoomAppliance> createState() => _RoomApplianceState();
}

class _RoomApplianceState extends State<RoomAppliance> {
  List<RoomApplianceItem> list = _dataList;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 25,
      children: list
          .map((data) => GestureDetector(
                onTap: () {
                  setState(
                    () {
                      //如果里面的innerData与外面的data一样，就把他改成相反的状态，
                      //如果不一样，就使用innerData
                      list = list
                          .map((innerData) => innerData == data
                              ? RoomApplianceItem(
                                  data.title,
                                  data.iconPoint,
                                  !data.isChecked,
                                )
                              : innerData)
                          .toList();
                    },
                  );
                  //通知父级
                  if (widget.onChange != null) {
                    widget.onChange(list);
                  }
                },
                behavior: HitTestBehavior.translucent,
                child: Container(
                  width: MediaQuery.of(context).size.width / 5,
                  child: Column(
                    children: [
                      Icon(
                        IconData(data.iconPoint, fontFamily: Config.CommonIcon),
                        size: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(data.title),
                      ),
                      CommonCheckButton(data.isChecked),
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }
}

class RoomApplianceList extends StatelessWidget {
  List<String> list;

  RoomApplianceList(this.list, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _showList =
        _dataList.where((item) => list.contains(item.title)).toList();
    return Wrap(
      runSpacing: 25,
      children: _showList
          .map((data) => Container(
                width: MediaQuery.of(context).size.width / 5,
                child: Column(
                  children: [
                    Icon(
                      IconData(data.iconPoint, fontFamily: Config.CommonIcon),
                      size: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(data.title),
                    ),
                  ],
                ),
              ))
          .toList(),
    );
  }
}
