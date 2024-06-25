import 'article_model.dart';

class NewsResponseModel {
  NewsResponseModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  final String? status;
  final int? totalResults;
  final List<ArticleModel> articles;

  factory NewsResponseModel.fromJson(Map<String, dynamic> json) {
    return NewsResponseModel(
      status: json["status"],
      totalResults: json["totalResults"],
      articles: json["articles"] == null
          ? []
          : List<ArticleModel>.from(
              json["articles"]!.map((x) => ArticleModel.fromJson(x))),
    );
  }
}
