import 'package:flutter/material.dart';
import 'package:hook_rent/page/home/tab_profile/function_button_data.dart';
import 'function_button_widget.dart';

class FunctionButton extends StatelessWidget {
  const FunctionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 1,
      runSpacing: 5,
      children: functionButtonItems
          .map((item) => FunctionButtonWidget(item))
          .toList(),
    );
  }
}
