import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hook_rent/page/home/tab_search/filter_bar/filter_bar_data.dart';
import 'package:hook_rent/scoped_model/filter_bar_model.dart';
import 'package:hook_rent/utils/common_picker.dart';
import 'package:hook_rent/utils/scoped_model_helper.dart';
import 'filter_bar_item.dart';

class FilterBar extends StatefulWidget {
  final ValueChanged<FilterBarResult> onChange;

  const FilterBar({required this.onChange, Key? key}) : super(key: key);

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  //四个按钮的激活状态
  bool isAreaActive = false;
  bool isRentTypeActive = false;
  bool isPriceActive = false;
  bool isFilterActive = false;

  //四个结果值
  String areaId = '';
  String rentTypeId = '';
  String priceId = '';
  List<String> moreIds = [];

  //四个响应事件
  //区域
  _onAreaChange(context) {
    setState(
      () {
        isAreaActive = true;
      },
    );
    var result = CommonPicker.showPicker(
      context: context,
      options: areaList.map((item) => item.name).toList(),
      value: 0,
    );
    result.then(
      (index) {
        if (index == null) return;
        setState(() {
          areaId = areaList[index].id;
        });
        _onChange();
      },
    ).whenComplete(() {
      setState(() {
        isAreaActive = false;
      });
    });
  }

  //方式
  _onRentTypeChange(context) {
    setState(
      () {
        isRentTypeActive = true;
      },
    );
    var result = CommonPicker.showPicker(
      context: context,
      options: rentTypeList.map((item) => item.name).toList(),
      value: 0,
    );
    result.then(
      (index) {
        if (index == null) return;
        setState(() {
          rentTypeId = rentTypeList[index].id;
        });
        _onChange();
      },
    ).whenComplete(() {
      setState(() {
        isRentTypeActive = false;
      });
    });
  }

  //租金
  _onPriceChange(context) {
    setState(
      () {
        isPriceActive = true;
      },
    );
    var result = CommonPicker.showPicker(
      context: context,
      options: priceList.map((item) => item.name).toList(),
      value: 0,
    );
    result.then(
      (index) {
        if (index == null) return;
        setState(() {
          priceId = priceList[index].id;
        });
        _onChange();
      },
    ).whenComplete(() {
      setState(() {
        isPriceActive = false;
      });
    });
  }

  //筛选
  _onFilterChange(context) {
    Scaffold.of(context).openEndDrawer();
  }

  //添加_onChange方法用于通知FilterBar的父组件
  _onChange() {
    var selectedList =
        ScopedModelHelper.getModel<FilterBarModel>(context).selectedList;
    if (widget.onChange != null) {
      widget.onChange(
        FilterBarResult(
          areaId: areaId,
          priceId: priceId,
          rentTypeId: rentTypeId,
          moreIds: selectedList.toList(),
        ),
      );
    }
  }

  _getData() {
    Map<String, List<GeneralType>> dataList = Map<String, List<GeneralType>>();
    dataList['roomTypeList'] = roomTypeList;
    dataList['orientedList'] = orientedList;
    dataList['floorList'] = floorList;
    ScopedModelHelper.getModel<FilterBarModel>(context).dataList = dataList;
  }

  @override
  void didChangeDependencies() {
    _onChange();
    super.didChangeDependencies();
  }

  @override
  void initState() {
    Timer.run(_getData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FilterBarItem(
            title: "区域",
            isActive: isAreaActive,
            onTap: _onAreaChange,
          ),
          FilterBarItem(
            title: "方式",
            isActive: isRentTypeActive,
            onTap: _onRentTypeChange,
          ),
          FilterBarItem(
            title: "租金",
            isActive: isPriceActive,
            onTap: _onPriceChange,
          ),
          FilterBarItem(
            title: "筛选",
            isActive: isFilterActive,
            onTap: _onFilterChange,
          ),
        ],
      ),
    );
  }
}
