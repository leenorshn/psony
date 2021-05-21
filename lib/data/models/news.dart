class ArticleResult {
  //late String status;
  late int totalResults;
  late List<Articles> articles;

  ArticleResult(
      { //required this.status,
      required this.totalResults,
      required this.articles});

  ArticleResult.fromJson(Map<String, dynamic> json) {
    // status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles.add(new Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    //data['status'] = this.status;
    data['totalResults'] = this.totalResults;
    data['articles'] = this.articles.map((v) => v.toJson()).toList();
    return data;
  }
}

class Articles {
  late Source source;
  String? author;
  late String title;
  String? description;
  late String url;
  String? urlToImage;
  late String publishedAt;
  String? content;

  Articles(
      {required this.source,
      this.author,
      required this.title,
      this.description,
      required this.url,
      this.urlToImage,
      required this.publishedAt,
      this.content});

  Articles.fromJson(Map<String, dynamic> json) {
    source = Source.fromJson(json['source']);
    author = json['author'] ?? "Inconnue";
    title = json['title'];
    description = json['description'] ?? " Pas de description";
    url = json['url'];
    urlToImage = json['urlToImage'] ??
        "http://www.intl-spectrum.com/articles/r75/ArticleDefault.jpg?x=528x372";
    publishedAt = json['publishedAt'];
    content = json['content'] ?? "Pas de contenue";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['source'] = this.source.toJson();
    data['author'] = this.author;
    data['title'] = this.title;
    data['description'] = this.description;
    data['url'] = this.url;
    data['urlToImage'] = this.urlToImage;
    data['publishedAt'] = this.publishedAt;
    data['content'] = this.content;
    return data;
  }
}

class Source {
  dynamic id;
  late String name;

  Source({this.id, required this.name});

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
