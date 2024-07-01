import '../../../data/model/article_model.dart';
import '../../repository/news_repository.dart';
import 'check_article_in_database_use_case.dart';

class CheckArticleInDatabaseUseCaseImpl
    implements CheckArticleInDatabaseUseCase {
  final NewsRepository _newsRepository;

  CheckArticleInDatabaseUseCaseImpl(this._newsRepository);

  @override
  Future<bool> check(ArticleModel article) async {
    return await _newsRepository.checkArticleInDatabase(article);
  }
}
