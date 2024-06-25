import '../../../data/model/news_response_model.dart';
import '../../entity/news_sort_options.dart';

abstract class GetNewsUseCase {
  Future<NewsResponseModel> get(
    String query,
    String fromDate,
    NewsSortOptions? sortOption,
  );
}
