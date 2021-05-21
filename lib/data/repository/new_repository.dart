import 'package:psony/data/data_source/news_api.dart';
import 'package:psony/data/models/news.dart';

class NewsRepository {
  final NewsApi newsApi;

  NewsRepository(this.newsApi);

  Future<ArticleResult> getArticleResults() async {
    Map<String, dynamic>? data = await newsApi.getNews();
    //print(">>>>> ${data.toString()}");
    return ArticleResult.fromJson(data!);
  }
}
