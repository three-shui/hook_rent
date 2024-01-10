import 'package:flutter/material.dart';
import 'package:hook_rent/utils/common_picker.dart';
import 'package:hook_rent/widgets/common_form_item.dart';

class CommonSelectFormItem extends StatelessWidget {
  final String label;
  final int value;
  final List<String> options;
  final Function(int) onChange;

  const CommonSelectFormItem(
      {required this.label,
      required this.value,
      required this.options,
      required this.onChange,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonFormItem(
        label: label,
        contentBuilder: (context) {
          return GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              var result = CommonPicker.showPicker(
                context: context,
                options: options,
                value: value,
              );
              result.then((selectValue) {
                if (value != selectValue &&
                    selectValue != null &&
                    onChange != null) {
                  onChange(selectValue);
                }
              });
            },
            child: SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    options[value],
                    style: TextStyle(fontSize: 16),
                  ),
                  Icon(Icons.chevron_right),
                ],
              ),
            ),
          );
        });
  }
}
