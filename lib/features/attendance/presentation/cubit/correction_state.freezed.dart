// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'correction_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CorrectionState {

 UIStatus get status; List<CorrectionRequest> get requests; List<CorrectionRequest> get myRequests; List<CorrectionRequest> get pendingRequests; String? get errorMessage; bool get isSubmitting; bool get isApproving;
/// Create a copy of CorrectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CorrectionStateCopyWith<CorrectionState> get copyWith => _$CorrectionStateCopyWithImpl<CorrectionState>(this as CorrectionState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as CorrectionState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CorrectionState&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.requests, _this.requests)&&const DeepCollectionEquality().equals(other.myRequests, _this.myRequests)&&const DeepCollectionEquality().equals(other.pendingRequests, _this.pendingRequests)&&(identical(other.errorMessage, _this.errorMessage) || other.errorMessage == _this.errorMessage)&&(identical(other.isSubmitting, _this.isSubmitting) || other.isSubmitting == _this.isSubmitting)&&(identical(other.isApproving, _this.isApproving) || other.isApproving == _this.isApproving));
}


@override
int get hashCode {
  final _this = this as CorrectionState;
  return Object.hash(runtimeType,_this.status,const DeepCollectionEquality().hash(_this.requests),const DeepCollectionEquality().hash(_this.myRequests),const DeepCollectionEquality().hash(_this.pendingRequests),_this.errorMessage,_this.isSubmitting,_this.isApproving);
}

@override
String toString() {
  final _this = this as CorrectionState;
  return 'CorrectionState(status: ${_this.status}, requests: ${_this.requests}, myRequests: ${_this.myRequests}, pendingRequests: ${_this.pendingRequests}, errorMessage: ${_this.errorMessage}, isSubmitting: ${_this.isSubmitting}, isApproving: ${_this.isApproving})';
}


}

/// @nodoc
abstract mixin class $CorrectionStateCopyWith<$Res>  {
  factory $CorrectionStateCopyWith(CorrectionState value, $Res Function(CorrectionState) _then) = _$CorrectionStateCopyWithImpl;
@useResult
$Res call({
 UIStatus status, List<CorrectionRequest> requests, List<CorrectionRequest> myRequests, List<CorrectionRequest> pendingRequests, String? errorMessage, bool isSubmitting, bool isApproving
});




}
/// @nodoc
class _$CorrectionStateCopyWithImpl<$Res>
    implements $CorrectionStateCopyWith<$Res> {
  _$CorrectionStateCopyWithImpl(this._self, this._then);

  final CorrectionState _self;
  final $Res Function(CorrectionState) _then;

/// Create a copy of CorrectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? requests = null,Object? myRequests = null,Object? pendingRequests = null,Object? errorMessage = freezed,Object? isSubmitting = null,Object? isApproving = null,}) {
  return _then(CorrectionState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UIStatus,requests: null == requests ? _self.requests : requests // ignore: cast_nullable_to_non_nullable
as List<CorrectionRequest>,myRequests: null == myRequests ? _self.myRequests : myRequests // ignore: cast_nullable_to_non_nullable
as List<CorrectionRequest>,pendingRequests: null == pendingRequests ? _self.pendingRequests : pendingRequests // ignore: cast_nullable_to_non_nullable
as List<CorrectionRequest>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isApproving: null == isApproving ? _self.isApproving : isApproving // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CorrectionState].
extension CorrectionStatePatterns on CorrectionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CorrectionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CorrectionState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CorrectionState value)  $default,){
final _that = this;
switch (_that) {
case _CorrectionState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CorrectionState value)?  $default,){
final _that = this;
switch (_that) {
case _CorrectionState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UIStatus status,  List<CorrectionRequest> requests,  List<CorrectionRequest> myRequests,  List<CorrectionRequest> pendingRequests,  String? errorMessage,  bool isSubmitting,  bool isApproving)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CorrectionState() when $default != null:
return $default(_that.status,_that.requests,_that.myRequests,_that.pendingRequests,_that.errorMessage,_that.isSubmitting,_that.isApproving);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UIStatus status,  List<CorrectionRequest> requests,  List<CorrectionRequest> myRequests,  List<CorrectionRequest> pendingRequests,  String? errorMessage,  bool isSubmitting,  bool isApproving)  $default,) {final _that = this;
switch (_that) {
case _CorrectionState():
return $default(_that.status,_that.requests,_that.myRequests,_that.pendingRequests,_that.errorMessage,_that.isSubmitting,_that.isApproving);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UIStatus status,  List<CorrectionRequest> requests,  List<CorrectionRequest> myRequests,  List<CorrectionRequest> pendingRequests,  String? errorMessage,  bool isSubmitting,  bool isApproving)?  $default,) {final _that = this;
switch (_that) {
case _CorrectionState() when $default != null:
return $default(_that.status,_that.requests,_that.myRequests,_that.pendingRequests,_that.errorMessage,_that.isSubmitting,_that.isApproving);case _:
  return null;

}
}

}

/// @nodoc


class _CorrectionState implements CorrectionState {
  const _CorrectionState({this.status = UIStatus.initial,  List<CorrectionRequest> requests = const [],  List<CorrectionRequest> myRequests = const [],  List<CorrectionRequest> pendingRequests = const [], this.errorMessage, this.isSubmitting = false, this.isApproving = false}): _requests = requests,_myRequests = myRequests,_pendingRequests = pendingRequests;
  

@override@JsonKey() final  UIStatus status;
 final  List<CorrectionRequest> _requests;
@override@JsonKey() List<CorrectionRequest> get requests {
  if (_requests is EqualUnmodifiableListView) return _requests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requests);
}

 final  List<CorrectionRequest> _myRequests;
@override@JsonKey() List<CorrectionRequest> get myRequests {
  if (_myRequests is EqualUnmodifiableListView) return _myRequests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_myRequests);
}

 final  List<CorrectionRequest> _pendingRequests;
@override@JsonKey() List<CorrectionRequest> get pendingRequests {
  if (_pendingRequests is EqualUnmodifiableListView) return _pendingRequests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pendingRequests);
}

@override final  String? errorMessage;
@override@JsonKey() final  bool isSubmitting;
@override@JsonKey() final  bool isApproving;

/// Create a copy of CorrectionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CorrectionStateCopyWith<_CorrectionState> get copyWith => __$CorrectionStateCopyWithImpl<_CorrectionState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CorrectionState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.requests, _requests)&&const DeepCollectionEquality().equals(other.myRequests, _myRequests)&&const DeepCollectionEquality().equals(other.pendingRequests, _pendingRequests)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isSubmitting, isSubmitting) || other.isSubmitting == isSubmitting)&&(identical(other.isApproving, isApproving) || other.isApproving == isApproving));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_requests),const DeepCollectionEquality().hash(_myRequests),const DeepCollectionEquality().hash(_pendingRequests),errorMessage,isSubmitting,isApproving);
}

@override
String toString() {
    return 'CorrectionState(status: $status, requests: $requests, myRequests: $myRequests, pendingRequests: $pendingRequests, errorMessage: $errorMessage, isSubmitting: $isSubmitting, isApproving: $isApproving)';
}


}

/// @nodoc
abstract mixin class _$CorrectionStateCopyWith<$Res> implements $CorrectionStateCopyWith<$Res> {
  factory _$CorrectionStateCopyWith(_CorrectionState value, $Res Function(_CorrectionState) _then) = __$CorrectionStateCopyWithImpl;
@override @useResult
$Res call({
 UIStatus status, List<CorrectionRequest> requests, List<CorrectionRequest> myRequests, List<CorrectionRequest> pendingRequests, String? errorMessage, bool isSubmitting, bool isApproving
});




}
/// @nodoc
class __$CorrectionStateCopyWithImpl<$Res>
    implements _$CorrectionStateCopyWith<$Res> {
  __$CorrectionStateCopyWithImpl(this._self, this._then);

  final _CorrectionState _self;
  final $Res Function(_CorrectionState) _then;

/// Create a copy of CorrectionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? requests = null,Object? myRequests = null,Object? pendingRequests = null,Object? errorMessage = freezed,Object? isSubmitting = null,Object? isApproving = null,}) {
  return _then(_CorrectionState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UIStatus,requests: null == requests ? _self._requests : requests // ignore: cast_nullable_to_non_nullable
as List<CorrectionRequest>,myRequests: null == myRequests ? _self._myRequests : myRequests // ignore: cast_nullable_to_non_nullable
as List<CorrectionRequest>,pendingRequests: null == pendingRequests ? _self._pendingRequests : pendingRequests // ignore: cast_nullable_to_non_nullable
as List<CorrectionRequest>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isSubmitting: null == isSubmitting ? _self.isSubmitting : isSubmitting // ignore: cast_nullable_to_non_nullable
as bool,isApproving: null == isApproving ? _self.isApproving : isApproving // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
