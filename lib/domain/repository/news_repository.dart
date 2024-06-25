import '../../data/model/news_response_model.dart';

abstract class NewsRepository {
  Future<NewsResponseModel> get(
    String query,
    String fromDate,
    String sortBy,
  );
}
