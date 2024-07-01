import '../../../data/model/article_model.dart';

abstract class GetFavouriteArticlesUseCase {
  Stream<List<ArticleModel>> get();
}
