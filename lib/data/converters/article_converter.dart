import '../data_source/local/database/collections/article/article_collection.dart';
import '../model/article_model.dart';
import 'source_converter.dart';

class ArticleConverter {
  final SourceConverter _sourceConverter;

  ArticleConverter(this._sourceConverter);

  ArticleEntity toEntity(ArticleModel article) => ArticleEntity()
    ..source = _sourceConverter.toEntity(article.source)
    ..author = article.author
    ..title = article.title
    ..description = article.description
    ..url = article.url
    ..urlToImage = article.urlToImage
    ..publishedAt = article.publishedAt
    ..content = article.content;

  ArticleModel fromEntity(ArticleEntity article) => ArticleModel(
        id: article.id,
        source: _sourceConverter.fromEntity(article.source),
        author: article.author,
        title: article.title,
        description: article.description,
        url: article.url,
        urlToImage: article.urlToImage,
        publishedAt: article.publishedAt,
        content: article.content,
      );
}
