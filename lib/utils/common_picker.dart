import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonPicker {
  static Future<int?> showPicker(
      {required BuildContext context,
      required List<String> options,
      required int value,
      double height = 300}) {
    return showCupertinoModalPopup<int>(
        context: context,
        builder: (BuildContext context) {
          var buttonTextStyle = const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          );
          var _controller = FixedExtentScrollController(initialItem: value);
          return Container(
            color: Colors.grey,
            height: height,
            child: Column(
              children: [
                Container(
                  height: 40,
                  color: Colors.grey[200],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("取消", style: buttonTextStyle)),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(_controller.selectedItem);
                          },
                          child: Text("确定", style: buttonTextStyle)),
                    ],
                  ),
                ),
                Expanded(
                  child: CupertinoPicker(
                    scrollController: _controller,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    itemExtent: 35,
                    onSelectedItemChanged: (value) {},
                    children: options.map((o) => Text(o)).toList(),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
