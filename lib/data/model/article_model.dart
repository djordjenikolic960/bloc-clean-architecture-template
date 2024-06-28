import '../../shared/constant.dart';
import 'source_model.dart';

class ArticleModel {
  ArticleModel({
    this.id,
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  final int? id;
  final SourceModel? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      source:
          json["source"] == null ? null : SourceModel.fromJson(json["source"]),
      author: json["author"],
      title: json["title"],
      description: json["description"],
      url: json["url"],
      urlToImage: json["urlToImage"],
      publishedAt:
          DateTime.tryParse(json["publishedAt"] ?? Constant.emptyString),
      content: json["content"],
    );
  }
}
