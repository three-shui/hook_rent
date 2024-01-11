import 'package:flutter/material.dart';
import 'package:hook_rent/page/home/info/info.dart';
import 'package:hook_rent/page/room_detail/room_detail_data.dart';
import 'package:hook_rent/widgets/common_swipper.dart';
import 'package:hook_rent/widgets/common_tag.dart';
import 'package:hook_rent/widgets/common_title.dart';
import 'package:hook_rent/widgets/room_appliance.dart';
import 'package:share_plus/share_plus.dart';

class RoomDetailPage extends StatefulWidget {
  final String? roomId;

  const RoomDetailPage({Key? key, this.roomId}) : super(key: key);

  @override
  State<RoomDetailPage> createState() => _RoomDetailPageState();
}

class _RoomDetailPageState extends State<RoomDetailPage> {
  RoomDetailData data = defaultData;
  bool _isLike = false;
  bool _showAllText = false;

  @override
  Widget build(BuildContext context) {
    //这里控制 展开/收起 按钮是否显示
    var _showTextTool = data.subTitle!.length > 100;
    return Scaffold(
      appBar: AppBar(
        title: Text(data.title!),
        actions: [
          IconButton(
            onPressed: () {
              Share.share('www.youtube.com');
            },
            icon: Icon(Icons.share),
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView(
            //加入IOS页面滚动回弹效果
            physics: BouncingScrollPhysics(),
            children: [
              CommonSwipper(images: data.houseImgs!),
              CommonTitle(title: data.title!),
              Padding(
                padding: const EdgeInsets.only(left: 17.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      data.price!.toString(),
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.pink,
                      ),
                    ),
                    Text(
                      " 元/月（押一付三）",
                      style: TextStyle(fontSize: 16, color: Colors.pink),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 10),
                child: Wrap(
                  spacing: 5,
                  children: data.tags!.map((tag) => CommonTag(tag)).toList(),
                ),
              ),
              Divider(color: Colors.black, indent: 10, endIndent: 10),
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                runSpacing: 8,
                children: [
                  BaseInfoItem(content: "面积：${data.size} 平米"),
                  BaseInfoItem(content: "楼层：${data.floor}"),
                  BaseInfoItem(content: "房型：${data.roomType}"),
                  BaseInfoItem(content: "装修：精装"),
                ],
              ),
              CommonTitle(title: "房屋配置"),
              RoomApplianceList(data.applicances!),
              CommonTitle(title: "房屋概况"),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 17),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.subTitle ?? "暂无房屋概况",
                      maxLines: _showAllText ? null : 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _showTextTool
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _showAllText = !_showAllText;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      _showAllText ? "收起" : "展开",
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    Icon(
                                      _showAllText
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down,
                                      color: Colors.green,
                                    ),
                                  ],
                                ),
                              )
                            : Container(),
                        const Text(
                          "举报",
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CommonTitle(title: "猜你喜欢"),
              Info(false),
              SizedBox(height: 100)
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[200],
              child: Row(
                children: [
                  Container(
                    height: 70,
                    width: 50,
                    margin: EdgeInsets.only(left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _isLike = !_isLike;
                            });
                          },
                          icon: Icon(
                            _isLike ? Icons.star : Icons.star_border,
                            size: 35,
                            color: _isLike ? Colors.green : Colors.black,
                          ),
                        ),
                        Text(_isLike ? "已收藏" : "收藏"),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("联系房东"),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.cyan),
                        minimumSize: MaterialStateProperty.all(
                          Size(double.infinity, 60),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("预约看房"),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green),
                        minimumSize: MaterialStateProperty.all(
                          Size(double.infinity, 60),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BaseInfoItem extends StatelessWidget {
  String content;

  BaseInfoItem({required this.content, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 3 * 17) / 2,
      padding: EdgeInsets.only(left: 17),
      child: Text(content, style: TextStyle(fontSize: 17)),
    );
  }
}
