import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

import 'common_image.dart';

const List<String> defaultImages = [
  "https://img.alicdn.com/imgextra/i3/196993935/O1CN01zpuGX81ewHPYyOVJe_!!196993935.jpg",
  "https://www.uniqlo.cn/public/image/L3/spl-contents/feature/uld/women/2023/yrf/750_231225_yrf2.jpg",
  "https://www.uniqlo.cn//public/image/L3/spl-contents/feature/outer/women/2023/1176_231222_wt01.jpg",
  "https://www.uniqlo.cn/public/image/L3/spl-contents/feature/fleece/women/img/1176_231027_ylr.jpg",
  "https://i0.hdslb.com/bfs/article/ceff7184b4e2df1af2128bec44ca69c9286431045.jpg@1256w_708h_!web-article-pic.webp",
  "https://i0.hdslb.com/bfs/article/c03c771116365f940a64d99ea322dfba286431045.jpg@1256w_708h_!web-article-pic.webp"
];

class CommonSwipper extends StatelessWidget {
  final List<String> images;

  CommonSwipper({this.images = defaultImages, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AspectRatio(
        aspectRatio: 16/9,
        child: Swiper(
          autoplay: true,
          itemBuilder: (context, index) {
            return CommonImage(
              images[index],
              fit: BoxFit.fill,
            );
          },
          itemCount: images.length,
          pagination: const SwiperPagination(),
        ),
      ),
    );
  }
}
