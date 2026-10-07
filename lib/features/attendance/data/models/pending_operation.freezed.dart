// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pending_operation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PendingOperation {

 String get id; String get type; Map<String, dynamic> get payload; DateTime get createdAt; int get retryCount; String? get lastError;
/// Create a copy of PendingOperation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PendingOperationCopyWith<PendingOperation> get copyWith => _$PendingOperationCopyWithImpl<PendingOperation>(this as PendingOperation, _$identity);

  /// Serializes this PendingOperation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PendingOperation;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PendingOperation&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.type, _this.type) || other.type == _this.type)&&const DeepCollectionEquality().equals(other.payload, _this.payload)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.retryCount, _this.retryCount) || other.retryCount == _this.retryCount)&&(identical(other.lastError, _this.lastError) || other.lastError == _this.lastError));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PendingOperation;
  return Object.hash(runtimeType,_this.id,_this.type,const DeepCollectionEquality().hash(_this.payload),_this.createdAt,_this.retryCount,_this.lastError);
}

@override
String toString() {
  final _this = this as PendingOperation;
  return 'PendingOperation(id: ${_this.id}, type: ${_this.type}, payload: ${_this.payload}, createdAt: ${_this.createdAt}, retryCount: ${_this.retryCount}, lastError: ${_this.lastError})';
}


}

/// @nodoc
abstract mixin class $PendingOperationCopyWith<$Res>  {
  factory $PendingOperationCopyWith(PendingOperation value, $Res Function(PendingOperation) _then) = _$PendingOperationCopyWithImpl;
@useResult
$Res call({
 String id, String type, Map<String, dynamic> payload, DateTime createdAt, int retryCount, String? lastError
});




}
/// @nodoc
class _$PendingOperationCopyWithImpl<$Res>
    implements $PendingOperationCopyWith<$Res> {
  _$PendingOperationCopyWithImpl(this._self, this._then);

  final PendingOperation _self;
  final $Res Function(PendingOperation) _then;

/// Create a copy of PendingOperation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? payload = null,Object? createdAt = null,Object? retryCount = null,Object? lastError = freezed,}) {
  return _then(PendingOperation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,payload: null == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,retryCount: null == retryCount ? _self.retryCount : retryCount // ignore: cast_nullable_to_non_nullable
as int,lastError: freezed == lastError ? _self.lastError : lastError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PendingOperation].
extension PendingOperationPatterns on PendingOperation {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PendingOperation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PendingOperation() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PendingOperation value)  $default,){
final _that = this;
switch (_that) {
case _PendingOperation():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PendingOperation value)?  $default,){
final _that = this;
switch (_that) {
case _PendingOperation() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String type,  Map<String, dynamic> payload,  DateTime createdAt,  int retryCount,  String? lastError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PendingOperation() when $default != null:
return $default(_that.id,_that.type,_that.payload,_that.createdAt,_that.retryCount,_that.lastError);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String type,  Map<String, dynamic> payload,  DateTime createdAt,  int retryCount,  String? lastError)  $default,) {final _that = this;
switch (_that) {
case _PendingOperation():
return $default(_that.id,_that.type,_that.payload,_that.createdAt,_that.retryCount,_that.lastError);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String type,  Map<String, dynamic> payload,  DateTime createdAt,  int retryCount,  String? lastError)?  $default,) {final _that = this;
switch (_that) {
case _PendingOperation() when $default != null:
return $default(_that.id,_that.type,_that.payload,_that.createdAt,_that.retryCount,_that.lastError);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PendingOperation implements PendingOperation {
  const _PendingOperation({required this.id, required this.type, required  Map<String, dynamic> payload, required this.createdAt, this.retryCount = 0, this.lastError}): _payload = payload;
  factory _PendingOperation.fromJson(Map<String, dynamic> json) => _$PendingOperationFromJson(json);

@override final  String id;
@override final  String type;
 final  Map<String, dynamic> _payload;
@override Map<String, dynamic> get payload {
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_payload);
}

@override final  DateTime createdAt;
@override@JsonKey() final  int retryCount;
@override final  String? lastError;

/// Create a copy of PendingOperation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PendingOperationCopyWith<_PendingOperation> get copyWith => __$PendingOperationCopyWithImpl<_PendingOperation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PendingOperationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PendingOperation&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.payload, _payload)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.retryCount, retryCount) || other.retryCount == retryCount)&&(identical(other.lastError, lastError) || other.lastError == lastError));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,type,const DeepCollectionEquality().hash(_payload),createdAt,retryCount,lastError);
}

@override
String toString() {
    return 'PendingOperation(id: $id, type: $type, payload: $payload, createdAt: $createdAt, retryCount: $retryCount, lastError: $lastError)';
}


}

/// @nodoc
abstract mixin class _$PendingOperationCopyWith<$Res> implements $PendingOperationCopyWith<$Res> {
  factory _$PendingOperationCopyWith(_PendingOperation value, $Res Function(_PendingOperation) _then) = __$PendingOperationCopyWithImpl;
@override @useResult
$Res call({
 String id, String type, Map<String, dynamic> payload, DateTime createdAt, int retryCount, String? lastError
});




}
/// @nodoc
class __$PendingOperationCopyWithImpl<$Res>
    implements _$PendingOperationCopyWith<$Res> {
  __$PendingOperationCopyWithImpl(this._self, this._then);

  final _PendingOperation _self;
  final $Res Function(_PendingOperation) _then;

/// Create a copy of PendingOperation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? payload = null,Object? createdAt = null,Object? retryCount = null,Object? lastError = freezed,}) {
  return _then(_PendingOperation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,payload: null == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,retryCount: null == retryCount ? _self.retryCount : retryCount // ignore: cast_nullable_to_non_nullable
as int,lastError: freezed == lastError ? _self.lastError : lastError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
