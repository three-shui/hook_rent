class IndexRecommendData {
  final String title;
  final String subTitle;
  final String imageUrl;
  final String navigateUrl;

  const IndexRecommendData(
      this.title, this.subTitle, this.imageUrl, this.navigateUrl);
}

const List<IndexRecommendData> datas = [
  IndexRecommendData(
      '家住回龙观', '归属的感觉', 'static/images/home_index_recommend_1.png', 'login'),
  IndexRecommendData(
      '宜居四五环', '大都市生活', 'static/images/home_index_recommend_2.png', 'register'),
  IndexRecommendData(
      '喧嚣三里屯', '繁华的背后', 'static/images/home_index_recommend_3.png', '/3435'),
  IndexRecommendData(
      '比邻十号线', '地铁心连心', 'static/images/home_index_recommend_4.png', '/434'),
];
