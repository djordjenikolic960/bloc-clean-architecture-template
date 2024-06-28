import '../../data/model/article_model.dart';
import '../../data/model/news_response_model.dart';

abstract class NewsRepository {
  Future<NewsResponseModel> get(
    String query,
    String fromDate,
    String sortBy,
  );

  Future<void> saveFavouriteArticle(ArticleModel article);

  Stream<List<ArticleModel>> getFavouriteArticles();

  Future<void> deleteArticle(ArticleModel article);
}
