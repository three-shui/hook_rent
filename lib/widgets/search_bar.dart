import 'package:flutter/material.dart';
import 'package:hook_rent/widgets/common_image.dart';

class SearchBar extends StatefulWidget {
  //展示位置按钮
  final bool? showLocation;

  //回退按钮函数
  final Function? goBackCallback;

  //搜索框输入值
  final String? inputValue;

  //搜索框默认值
  final String? defaultInputValue;

  //取消按钮
  final Function? onCancel;

  //展示地图按钮
  final bool? showMap;

  //用户点击搜索框触发
  final Function? onSearch;

  //用户输入搜索词后，点击键盘的搜索键触发
  final ValueChanged<String>? onSearchSubmit;

  const SearchBar(
      {Key? key,
      this.showLocation,
      this.goBackCallback,
      this.inputValue = "",
      this.defaultInputValue = "please input",
      this.onCancel,
      this.showMap,
      this.onSearch,
      this.onSearchSubmit})
      : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String _searchWords = "";
  late TextEditingController _controller;
  late FocusNode _focus;

  _onClear() {
    _controller.clear();
    setState(() {
      _searchWords = "";
    });
  }

  @override
  void initState() {
    _focus = FocusNode();
    _controller = TextEditingController(text: widget.inputValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.showLocation != null)
          Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: GestureDetector(
              onTap: () {
                //TODO
              },
              child: Row(
                children: [
                  Icon(Icons.room, color: Colors.green),
                  Text(
                    "北京",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        if (widget.goBackCallback != null)
          Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: GestureDetector(
                onTap: () {
                  widget.goBackCallback;
                },
                child: Icon(Icons.chevron_left, color: Colors.black, size: 35)),
          ),
        Expanded(
          child: Container(
            height: 30,
            margin: EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15)),
            child: TextField(
              focusNode: _focus,
              onTap: () {
                widget.onSearch!();
                //如果onSearchSubmit方法为null，说明不是在搜索页，就失去焦点
                if (widget.onSearchSubmit == null) {
                  //失去焦点
                  _focus.unfocus();
                }
              },
              onSubmitted: widget.onSearchSubmit,
              onChanged: (value) {
                setState(() {
                  _searchWords = value;
                });
              },
              controller: _controller,
              //更改软键盘的回车键
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                  hintText: "请输入搜索词",
                  // contentPadding: EdgeInsets.symmetric(vertical: 9.0),
                  contentPadding: EdgeInsets.only(left: -13, top: 9, bottom: 9),
                  border: InputBorder.none,
                  fillColor: Colors.red,
                  //这里不用prefixIcon，因为prefixIcon与hintText之间的距离太大
                  icon: const Padding(
                    padding: EdgeInsets.only(left: 9.0),
                    child: Icon(
                      Icons.search,
                      size: 20,
                    ),
                  ),
                  suffixIcon: GestureDetector(
                      onTap: () {
                        _onClear();
                      },
                      child: Icon(
                        Icons.clear,
                        color:
                            _searchWords == "" ? Colors.grey[200] : Colors.grey,
                      ))),
            ),
          ),
        ),
        if (widget.onCancel != null)
          Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: GestureDetector(
              onTap: () {
                widget.onCancel;
              },
              child: Text(
                "取消",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        if (widget.showMap != null)
          GestureDetector(
              onTap: () {
                widget.onSearch;
              },
              child: CommonImage(
                "static/icons/widget_search_bar_map.png",
              ))
      ],
    );
  }
}
