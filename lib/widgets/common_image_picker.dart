import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

const List<String> defautImages = [
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tdgve1j30ku0bsn75.jpg',
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2whp87sj30ku0bstec.jpg',
  'http://ww3.sinaimg.cn/large/006y8mN6ly1g6e2tl1v3bj30ku0bs77z.jpg',
];

// 设置图片宽高
var imageWidth = 750.0;
var imageHeight = 424.0;
var imageWidgetHeightRatio = imageWidth / imageHeight; //宽高比

class CommonImagePicker extends StatefulWidget {
  final ValueChanged<List<File>> onChange;

  const CommonImagePicker({Key? key, required this.onChange}) : super(key: key);

  @override
  State<CommonImagePicker> createState() => _CommonImagePickerState();
}

class _CommonImagePickerState extends State<CommonImagePicker> {
  late List<File> files = [];

  _pickImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    setState(() {
      //这里File的作用：将XFile转换为文件
      files = files..add(File(image.path));
    });
    //这里还要通知父级，告诉他我们修改了图片，并将图片传给父级
    if (widget.onChange != null) {
      widget.onChange(files);
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = (MediaQuery.of(context).size.width - 10 * 4) / 3;
    var height = width / imageWidgetHeightRatio;
    //图片添加按钮
    Widget addButton = GestureDetector(
      onTap: () {
        _pickImage();
      },
      child: Container(
        height: height,
        width: width,
        color: Colors.grey[350],
        child: Center(
          child: Text(
            "+",
            style: TextStyle(
                color: Colors.grey[600],
                fontSize: 40,
                fontWeight: FontWeight.w300),
          ),
        ),
      ),
    );

    //这是一个方法，接收图片的url，返回一个图片组件
    Widget wrapper(File file) {
      return Stack(
        // overflow: Overflow.visible,
        //overflow 属性在 Flutter 2.x 版本中被替换为 clipBehavior
        clipBehavior: Clip.none,
        children: [
          Image.file(
            file,
            height: height,
            width: width,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: -20,
            right: -20,
            child: IconButton(
              onPressed: () {
                setState(() {
                  //这里File的作用：将XFile转换为文件
                  files = files..remove(file);
                });
                //这里还要通知父级，告诉他我们修改了图片，并将图片传给父级
                if (widget.onChange != null) {
                  widget.onChange(files);
                }
              },
              icon: Icon(
                Icons.delete_forever,
                color: Colors.red[500],
              ),
            ),
          ),
        ],
      );
    }

    //创建图片列表
    List<Widget> list = files.map((file) => wrapper(file)).toList()
      ..add(addButton);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: list,
      ),
    );
  }
}
