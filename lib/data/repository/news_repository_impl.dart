import '../../domain/repository/news_repository.dart';
import '../converters/article_converter.dart';
import '../data_source/local/database/collections/article/article_collection.dart';
import '../data_source/local/database/database_manager.dart';
import '../data_source/remote/network/network_client.dart';
import '../model/article_model.dart';
import '../model/news_response_model.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NetworkClient _networkClient;
  final DatabaseManager _databaseManager;
  final ArticleConverter _articleConverter;

  NewsRepositoryImpl(
    this._networkClient,
    this._databaseManager,
    this._articleConverter,
  );

  @override
  Future<NewsResponseModel> get(
    String query,
    String fromDate,
    String sortBy,
  ) async {
    final response = await _networkClient.get<Map<String, dynamic>>(
      "/everything",
      {
        "q": query,
        "from": fromDate,
        "sortBy": sortBy,
        "pageSize": "5",
        "page": "1",
      },
    );
    return NewsResponseModel.fromJson(response);
  }

  @override
  Future<void> saveFavouriteArticle(ArticleModel article) async {
    final articleEntity = _articleConverter.toEntity(article);
    await _databaseManager.put<ArticleEntity>(articleEntity);
  }

  @override
  Stream<List<ArticleModel>> getFavouriteArticles() {
    return _databaseManager.getCollectionStream<ArticleEntity>().map(
          (entities) => entities
              .map((entity) => _articleConverter.fromEntity(entity),)
              .toList(),
        );
  }

  @override
  Future<void> deleteArticle(ArticleModel article) async {
    await _databaseManager.delete<ArticleEntity>(article.id!);
  }
}
