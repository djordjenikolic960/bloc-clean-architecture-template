import '../../../data/model/article_model.dart';

abstract class AddArticleToFavouritesUseCase {
  Future<void> add(ArticleModel article);
}
