import 'package:flutter/material.dart';
import 'package:hook_rent/scoped_model/filter_bar_model.dart';
import 'package:hook_rent/utils/scoped_model_helper.dart';
import 'package:hook_rent/widgets/common_title.dart';
import 'filter_bar_data.dart';

class FilterDrawer extends StatelessWidget {
  const FilterDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dataList = ScopedModelHelper.getModel<FilterBarModel>(context).dataList;
    roomTypeList = dataList["roomTypeList"]!;
    orientedList = dataList["orientedList"]!;
    roomTypeList = dataList["roomTypeList"]!;

    var selectedIds = ScopedModelHelper.getModel<FilterBarModel>(context)
        .selectedList
        .toList();

    _onChange(String s) {
      ScopedModelHelper.getModel<FilterBarModel>(context)
          .selectedListToggleItem(s);
    }

    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            CommonTitle(title: "户型"),
            FilterDrawItem(
              list: roomTypeList,
              selectedIds: selectedIds,
              onChange: _onChange,
            ),
            CommonTitle(title: "朝向"),
            FilterDrawItem(
              list: orientedList,
              selectedIds: selectedIds,
              onChange: _onChange,
            ),
            CommonTitle(title: "楼层"),
            FilterDrawItem(
              list: floorList,
              selectedIds: selectedIds,
              onChange: _onChange,
            ),
          ],
        ),
      ),
    );
  }
}

class FilterDrawItem extends StatelessWidget {
  final List<GeneralType> list;
  final List<String> selectedIds;
  final ValueChanged<String> onChange;

  const FilterDrawItem(
      {required this.list,
      required this.selectedIds,
      required this.onChange,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
        runSpacing: 10,
        children: list.map((item) {
          var isActive = selectedIds.contains(item.id);
          return Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: GestureDetector(
              onTap: () {
                onChange(item.id);
              },
              behavior: HitTestBehavior.translucent,
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                  color: isActive ? Colors.green : Colors.white,
                  border: Border.all(color: Colors.green),
                ),
                child: Text(
                  item.name,
                  style: TextStyle(
                      fontSize: 15,
                      color: isActive ? Colors.white : Colors.green),
                ),
              ),
            ),
          );
        }).toList());
  }
}
