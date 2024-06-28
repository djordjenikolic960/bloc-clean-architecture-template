import '../../../data/model/article_model.dart';
import '../../repository/news_repository.dart';
import 'save_favourite_article_use_case.dart';

class SaveFavouriteArticleUseCaseImpl implements SaveFavouriteArticleUseCase {
  final NewsRepository _newsRepository;

  SaveFavouriteArticleUseCaseImpl(this._newsRepository);

  @override
  Future<void> save(ArticleModel article) async {
    await _newsRepository.saveFavouriteArticle(article);
  }
}
