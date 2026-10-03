/// كائن الإخفاق الموحد (Failure) المستخدم في طبقة الـ Domain والـ Presentation
abstract class Failure {
  final String messageKey;
  final String? code;
  final dynamic error;

  const Failure(this.messageKey, {this.code, this.error});

  @override
  String toString() => messageKey;
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.messageKey = 'error_network_connection', String? code = 'NET_001'])
      : super(code: code);
}

class ServerFailure extends Failure {
  const ServerFailure([super.messageKey = 'error_server_internal', String? code = 'SRV_001', dynamic error])
      : super(code: code, error: error);
}

class CacheFailure extends Failure {
  const CacheFailure([super.messageKey = 'error_cache_failure', String? code = 'CACHE_001'])
      : super(code: code);
}

class AuthFailure extends Failure {
  const AuthFailure([super.messageKey = 'error_unauthorized', String? code = 'AUTH_401'])
      : super(code: code);
}

class ValidationFailure extends Failure {
  const ValidationFailure([super.messageKey = 'error_validation_failed', String? code = 'VAL_001'])
      : super(code: code);
}

class UnknownFailure extends Failure {
  const UnknownFailure([super.messageKey = 'error_unknown', String? code = 'UNK_000', dynamic error])
      : super(code: code, error: error);
}
