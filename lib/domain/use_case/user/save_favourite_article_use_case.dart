import '../../../data/model/article_model.dart';

abstract class SaveFavouriteArticleUseCase {
  Future<void> save(ArticleModel article);
}
