import '../../domain/repository/news_repository.dart';
import '../data_source/remote/network/network_client.dart';
import '../model/news_response_model.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NetworkClient _networkClient;

  NewsRepositoryImpl(
    this._networkClient,
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
        "pageSize": "10",
        "page": "1",
      },
    );
    return NewsResponseModel.fromJson(response);
  }
}
