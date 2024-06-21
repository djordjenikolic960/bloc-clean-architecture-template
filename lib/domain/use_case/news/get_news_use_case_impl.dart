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
  Future<Map<String, dynamic>> get(
    String query,
    String fromDate,
    String sortBy,
  ) async {
    _addAuthHeaderUseCase.addAuthHeader();
    return await _newsRepository.get(
      query,
      fromDate,
      sortBy,
    );
  }
}
