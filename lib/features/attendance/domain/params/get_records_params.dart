import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_records_params.freezed.dart';
part 'get_records_params.g.dart';

@freezed
abstract class GetRecordsParams with _$GetRecordsParams {
  const factory GetRecordsParams({
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'month') String? month,
    @JsonKey(name: 'date') String? date,
    @JsonKey(name: 'limit') @Default(50) int limit,
  }) = _GetRecordsParams;

  factory GetRecordsParams.fromJson(Map<String, dynamic> json) =>
      _$GetRecordsParamsFromJson(json);
}
