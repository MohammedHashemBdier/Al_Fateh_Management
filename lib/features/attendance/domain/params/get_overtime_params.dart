import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_overtime_params.freezed.dart';
part 'get_overtime_params.g.dart';

@freezed
abstract class GetOvertimeParams with _$GetOvertimeParams {
  const factory GetOvertimeParams({@JsonKey(name: 'user_id') String? userId}) =
      _GetOvertimeParams;

  factory GetOvertimeParams.fromJson(Map<String, dynamic> json) =>
      _$GetOvertimeParamsFromJson(json);
}
