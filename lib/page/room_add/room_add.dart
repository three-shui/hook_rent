import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hook_rent/widgets/CommonFloatingActionButton.dart';
import 'package:hook_rent/widgets/common_form_item.dart';
import 'package:hook_rent/widgets/common_image_picker.dart';
import 'package:hook_rent/widgets/common_radio_form_item.dart';
import 'package:hook_rent/widgets/common_select_from_item.dart';
import 'package:hook_rent/widgets/common_title.dart';

class RoomAdd extends StatefulWidget {
  const RoomAdd({Key? key}) : super(key: key);

  @override
  State<RoomAdd> createState() => _RoomAddState();
}

class _RoomAddState extends State<RoomAdd> {
  //租赁类型
  int rentType = 0;

  //装修类型
  int decorationType = 0;

  //户型
  int roomType = 0;

  //楼层
  int floor = 0;

  //朝向
  int orienten = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("房源发布"),
      ),
      floatingActionButton:
          CommonFloatingActionButton(title: "提交", onTap: () {}),
      body: ListView(
        children: [
          const CommonTitle(title: "房源信息"),
          CommonFormItem(
            label: "小区",
            contentBuilder: (context) {
              return GestureDetector(
                //这里可以让空白区域的点击也有效果
                behavior: HitTestBehavior.translucent,
                child: Container(
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "请选择小区",
                        style: TextStyle(fontSize: 16),
                      ),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                ),
                onTap: () => Navigator.of(context).pushNamed("search"),
              );
            },
          ),
          CommonFormItem(
            label: "租金",
            hitText: "请输入租金",
            suffixText: "元/月",
            controller: TextEditingController(),
          ),
          CommonFormItem(
            label: "大小",
            hitText: "请输入房屋大小",
            suffixText: "平方米",
            controller: TextEditingController(),
          ),
          CommonRadioFormItem(
            label: "租赁方式",
            options: ["合租", "整租"],
            value: rentType,
            onChange: (index) {
              setState(() {
                rentType = index;
              });
            },
          ),
          CommonSelectFormItem(
            label: "户型",
            value: roomType,
            options: const ["一室", "二室", "三室", "四室"],
            onChange: (value) {
              setState(() {
                roomType = value;
              });
            },
          ),
          CommonSelectFormItem(
            label: "楼层",
            value: floor,
            options: const ["高楼层", "中楼层", "低楼层"],
            onChange: (value) {
              setState(() {
                floor = value;
              });
            },
          ),
          CommonSelectFormItem(
            label: "朝向",
            value: orienten,
            options: const ["east", "north", "west", "south"],
            onChange: (value) {
              setState(() {
                orienten = value;
              });
            },
          ),
          CommonRadioFormItem(
            label: "装修",
            options: ["精装", "简装"],
            value: decorationType,
            onChange: (index) {
              setState(() {
                decorationType = index;
              });
            },
          ),
          CommonTitle(title: "房屋图片"),
          CommonImagePicker(onChange: (List<File> files) {}),
          CommonTitle(title: "房屋标题"),
          CommonTitle(title: "房屋配置"),
          CommonTitle(title: "房屋描述"),
        ],
      ),
    );
  }
}
