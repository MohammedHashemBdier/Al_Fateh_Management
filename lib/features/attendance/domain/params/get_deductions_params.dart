import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_deductions_params.freezed.dart';
part 'get_deductions_params.g.dart';

@freezed
abstract class GetDeductionsParams with _$GetDeductionsParams {
  const factory GetDeductionsParams({
    @JsonKey(name: 'user_id') String? userId,
  }) = _GetDeductionsParams;

  factory GetDeductionsParams.fromJson(Map<String, dynamic> json) =>
      _$GetDeductionsParamsFromJson(json);
}
