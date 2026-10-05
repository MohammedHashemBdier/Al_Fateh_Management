/// نوع العملية المخزنة في طابور المزامنة عند عدم توفر الإنترنت
enum SyncOperationType { addTicket, updateTicket, addProblemType }

/// كائن عملية المزامنة
class SyncOperation {
  final String id;
  final SyncOperationType type;
  final Map<String, dynamic> payload;
  final DateTime createdAt;
  final int retryCount;
  final String? lastError;

  const SyncOperation({
    required this.id,
    required this.type,
    required this.payload,
    required this.createdAt,
    this.retryCount = 0,
    this.lastError,
  });

  SyncOperation copyWith({int? retryCount, String? lastError}) {
    return SyncOperation(
      id: id,
      type: type,
      payload: payload,
      createdAt: createdAt,
      retryCount: retryCount ?? this.retryCount,
      lastError: lastError ?? this.lastError,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type.name,
    'payload': payload,
    'created_at': createdAt.toIso8601String(),
    'retry_count': retryCount,
    'last_error': lastError,
  };

  factory SyncOperation.fromJson(Map<String, dynamic> json) {
    SyncOperationType t = SyncOperationType.addTicket;
    for (final val in SyncOperationType.values) {
      if (val.name == json['type']) {
        t = val;
        break;
      }
    }
    return SyncOperation(
      id: json['id']?.toString() ?? '',
      type: t,
      payload: (json['payload'] as Map<String, dynamic>?) ?? {},
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'].toString()) ?? DateTime.now()
          : DateTime.now(),
      retryCount: int.tryParse(json['retry_count']?.toString() ?? '0') ?? 0,
      lastError: json['last_error']?.toString(),
    );
  }
}
