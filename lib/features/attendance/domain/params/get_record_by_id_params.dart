import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_record_by_id_params.freezed.dart';
part 'get_record_by_id_params.g.dart';

@freezed
abstract class GetRecordByIdParams with _$GetRecordByIdParams {
  const factory GetRecordByIdParams({
    @JsonKey(name: 'record_id') required String recordId,
  }) = _GetRecordByIdParams;

  factory GetRecordByIdParams.fromJson(Map<String, dynamic> json) =>
      _$GetRecordByIdParamsFromJson(json);
}
