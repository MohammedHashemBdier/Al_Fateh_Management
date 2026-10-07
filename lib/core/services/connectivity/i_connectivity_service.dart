enum ConnectionStatus { online, offline, syncing, error }

abstract interface class IConnectivityService {
  Stream<ConnectionStatus> get statusStream;
  Future<ConnectionStatus> get getCurrentStatus;
  Future<bool> get isOnline;
}
