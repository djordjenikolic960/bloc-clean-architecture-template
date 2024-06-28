import '../../../data/model/article_model.dart';
import '../../repository/news_repository.dart';
import 'delete_article_use_case.dart';

class DeleteArticleUseCaseImpl implements DeleteArticleUseCase {
  final NewsRepository _newsRepository;

  DeleteArticleUseCaseImpl(
    this._newsRepository,
  );

  @override
  Future<void> delete(ArticleModel article) async {
    await _newsRepository.deleteArticle(article);
  }
}
