enum SyncState { idle, syncing, completed, failed }

class SyncStatusEvent {
  final SyncState state;
  final int pendingCount;
  final String? message;

  const SyncStatusEvent({
    required this.state,
    required this.pendingCount,
    this.message,
  });
}

abstract interface class ISyncService {
  Future<void> syncPendingOperations();
  Future<int> getPendingCount();
  Stream<SyncStatusEvent> get syncStatusStream;
  void startAutoSync();
  void stopAutoSync();
}
