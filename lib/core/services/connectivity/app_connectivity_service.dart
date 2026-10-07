import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

import 'i_connectivity_service.dart';

@LazySingleton(as: IConnectivityService)
class AppConnectivityService implements IConnectivityService {
  final Connectivity _connectivity;

  AppConnectivityService() : _connectivity = Connectivity();
  AppConnectivityService.withCustom(this._connectivity);

  @override
  Stream<ConnectionStatus> get statusStream {
    return _connectivity.onConnectivityChanged.map((results) {
      final isConnected = results.any((r) => r != ConnectivityResult.none);
      return isConnected ? ConnectionStatus.online : ConnectionStatus.offline;
    });
  }

  @override
  Future<ConnectionStatus> get getCurrentStatus async {
    final results = await _connectivity.checkConnectivity();
    final isConnected = results.any((r) => r != ConnectivityResult.none);
    return isConnected ? ConnectionStatus.online : ConnectionStatus.offline;
  }

  @override
  Future<bool> get isOnline async {
    final status = await getCurrentStatus;
    return status == ConnectionStatus.online;
  }
}
