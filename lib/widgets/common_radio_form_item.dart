import 'package:flutter/material.dart';
import 'package:hook_rent/widgets/common_form_item.dart';

class CommonRadioFormItem extends StatelessWidget {
  final String label;
  final List<String> options;
  final int value;
  final ValueChanged onChange;

  const CommonRadioFormItem(
      {required this.label,
      required this.options,
      required this.value,
      required this.onChange,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonFormItem(
        label: label,
        contentBuilder: (context) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            //这里不能用options.map(),因为在dart的map中没有index，这里需要index
            children: List.generate(
              options.length,
              (index) => Row(
                children: [
                  Radio(value: index, groupValue: value, onChanged: onChange),
                  Text(options[index])
                ],
              ),
            ),
          );
        });
  }
}
