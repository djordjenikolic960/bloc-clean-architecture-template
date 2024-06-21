
import '../../domain/repository/news_repository.dart';
import '../data_source/remote/network/network_client.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NetworkClient _networkClient;

  NewsRepositoryImpl(
    this._networkClient,
  );

  @override
  Future<Map<String, dynamic>> get(
    String query,
    String fromDate,
    String sortBy,
  ) async {
    final data = await _networkClient.get<Map<String, dynamic>>(
      "/everything",
      {
        "q": query,
        "from": fromDate,
        "sortBy": sortBy,
      },
    );
    return data;
  }
}
