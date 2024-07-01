import '../../../data/model/article_model.dart';

abstract class CheckArticleInDatabaseUseCase {
  Future<bool> check(ArticleModel article);
}
