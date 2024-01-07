import 'package:flutter/material.dart';
import 'package:hook_rent/widgets/common_image.dart';

import 'function_button_data.dart';

class FunctionButtonWidget extends StatelessWidget {
  final FunctionButtonItem item;

  const FunctionButtonWidget(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(item.onTapHandle != null){
          item.onTapHandle!(context);
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width*0.33,
        child: Column(children: [
          CommonImage(item.imageUrl),
          Text(item.title)
        ],),
      ),
    );
  }
}
