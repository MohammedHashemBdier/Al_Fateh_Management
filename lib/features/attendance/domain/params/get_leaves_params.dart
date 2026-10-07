import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_leaves_params.freezed.dart';
part 'get_leaves_params.g.dart';

@freezed
abstract class GetLeavesParams with _$GetLeavesParams {
  const factory GetLeavesParams({@JsonKey(name: 'user_id') String? userId}) =
      _GetLeavesParams;

  factory GetLeavesParams.fromJson(Map<String, dynamic> json) =>
      _$GetLeavesParamsFromJson(json);
}
