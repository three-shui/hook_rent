import 'package:flutter/material.dart';
import 'package:hook_rent/widgets/common_image.dart';
import 'index_recommend_data.dart';

class IndexRecommendItem extends StatelessWidget {
  final IndexRecommendData data;

  const IndexRecommendItem(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(data.navigateUrl),
      child: Container(
        color: Colors.white,
        height: 70,
        width: (MediaQuery.of(context).size.width - 10.0 * 3) / 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.title,
                    style:
                        const TextStyle(fontSize: 17)),
                Text(data.subTitle,
                    style: const TextStyle(fontSize: 15, color: Colors.grey)),
              ],
            ),
            CommonImage(data.imageUrl, width: 60.0),
          ],
        ),
      ),
    );
  }
}
