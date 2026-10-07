/// حالات واجهة المستخدم الموحدة (UI Status)
enum UIStatus { initial, loading, loaded, empty, error, syncing, refreshing }

extension UIStatusX on UIStatus {
  bool get isInitial => this == UIStatus.initial;
  bool get isLoading => this == UIStatus.loading;
  bool get isLoaded => this == UIStatus.loaded;
  bool get isEmpty => this == UIStatus.empty;
  bool get isError => this == UIStatus.error;
  bool get isSyncing => this == UIStatus.syncing;
  bool get isRefreshing => this == UIStatus.refreshing;
}
