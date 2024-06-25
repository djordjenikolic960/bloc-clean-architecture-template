import '../../../data/model/news_response_model.dart';
import '../../entity/news_sort_options.dart';
import '../../repository/news_repository.dart';
import '../network_client/add_auth_header_use_case.dart';
import 'get_news_use_case.dart';

class GetNewsUseCaseImpl implements GetNewsUseCase {
  final NewsRepository _newsRepository;
  final AddAuthHeaderUseCase _addAuthHeaderUseCase;

  GetNewsUseCaseImpl(
    this._newsRepository,
    this._addAuthHeaderUseCase,
  );

  @override
  Future<NewsResponseModel> get(
    String query,
    String fromDate,
    NewsSortOptions? sortOption,
  ) async {
    _addAuthHeaderUseCase.addAuthHeader();
    final sortBy = sortOption == null
        ? NewsSortOptions.publishedAt.name
        : sortOption.name;
    return await _newsRepository.get(
      query,
      fromDate,
      sortBy,
    );
  }
}
