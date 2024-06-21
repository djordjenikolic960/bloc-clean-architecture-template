import '../../../data/data_source/remote/network/constants.dart';
import '../../repository/network_client_repository.dart';
import 'add_auth_header_use_case.dart';

class AddAuthHeaderUseCaseImpl implements AddAuthHeaderUseCase {
  final NetworkClientRepository _networkClientRepository;

  AddAuthHeaderUseCaseImpl(this._networkClientRepository);

  @override
  void addAuthHeader() {
    _networkClientRepository.addAuthHeader(NetworkConstants.newsApiKey);
  }
}
