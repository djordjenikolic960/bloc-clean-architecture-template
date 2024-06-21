import 'dart:io';

import '../../domain/repository/network_client_repository.dart';
import '../data_source/remote/network/constants.dart';
import '../data_source/remote/network/network_client.dart';

class NetworkClientRepositoryImpl implements NetworkClientRepository {
  final NetworkClient _networkClient;

  NetworkClientRepositoryImpl(this._networkClient);

  @override
  void addAuthHeader(String accessToken) {
    _networkClient.addHeaderParam(HttpHeaders.authorizationHeader,
        "${NetworkConstants.bearer}$accessToken");
  }
}