import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage_2/provider.dart';

final _networkImageReg = RegExp("^http");
final _localImageReg = RegExp("^static");

class CommonImage extends StatelessWidget {
  final String src;
  final double? width;
  final BoxFit? fit;

  const CommonImage(this.src,
      {this.fit = BoxFit.fill, Key? key, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //1.如果是网络图片
    if (_networkImageReg.hasMatch(src)) {
      return Image(
          width: width,
          fit: fit,
          image: AdvancedNetworkImage(
            src,
            useDiskCache: true,
            cacheRule: CacheRule(maxAge: Duration(days: 7)),
            timeoutDuration: Duration(seconds: 20),
          ));
    }
    //2.如果是本地图片
    if (_localImageReg.hasMatch(src)) {
      return Image.asset(src, width: width);
      // return Image.asset(src, fit: fit);
    }
    //提示
    assert(false, "图片地址不合法");
    return Container();
  }
}
