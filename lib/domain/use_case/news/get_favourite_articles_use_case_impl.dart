import '../../../data/model/article_model.dart';
import '../../repository/news_repository.dart';
import 'get_favourite_articles_use_case.dart';

class GetFavouriteArticlesUseCaseImpl implements GetFavouriteArticlesUseCase {
  final NewsRepository _newsRepository;

  GetFavouriteArticlesUseCaseImpl(
    this._newsRepository,
  );

  @override
  Stream<List<ArticleModel>> get() {
    return _newsRepository.getFavouriteArticles();
  }
}
