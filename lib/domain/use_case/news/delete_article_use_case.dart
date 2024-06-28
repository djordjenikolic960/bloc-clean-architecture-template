import '../../../data/model/article_model.dart';

abstract class DeleteArticleUseCase {
  Future<void> delete(ArticleModel article);
}
