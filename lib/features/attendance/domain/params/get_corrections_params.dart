import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_corrections_params.freezed.dart';
part 'get_corrections_params.g.dart';

@freezed
abstract class GetCorrectionsParams with _$GetCorrectionsParams {
  const factory GetCorrectionsParams({
    @JsonKey(name: 'user_id') String? userId,
  }) = _GetCorrectionsParams;

  factory GetCorrectionsParams.fromJson(Map<String, dynamic> json) =>
      _$GetCorrectionsParamsFromJson(json);
}
