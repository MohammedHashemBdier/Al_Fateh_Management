// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AttendanceHistoryState {

 UIStatus get status; List<AttendanceRecord> get records; List<AttendanceRecord> get filteredRecords; AttendanceFilter? get filter; int get currentPage; int get pageSize; bool get hasMore; bool get isLoadingMore; String? get errorMessage;
/// Create a copy of AttendanceHistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceHistoryStateCopyWith<AttendanceHistoryState> get copyWith => _$AttendanceHistoryStateCopyWithImpl<AttendanceHistoryState>(this as AttendanceHistoryState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AttendanceHistoryState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceHistoryState&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.records, _this.records)&&const DeepCollectionEquality().equals(other.filteredRecords, _this.filteredRecords)&&(identical(other.filter, _this.filter) || other.filter == _this.filter)&&(identical(other.currentPage, _this.currentPage) || other.currentPage == _this.currentPage)&&(identical(other.pageSize, _this.pageSize) || other.pageSize == _this.pageSize)&&(identical(other.hasMore, _this.hasMore) || other.hasMore == _this.hasMore)&&(identical(other.isLoadingMore, _this.isLoadingMore) || other.isLoadingMore == _this.isLoadingMore)&&(identical(other.errorMessage, _this.errorMessage) || other.errorMessage == _this.errorMessage));
}


@override
int get hashCode {
  final _this = this as AttendanceHistoryState;
  return Object.hash(runtimeType,_this.status,const DeepCollectionEquality().hash(_this.records),const DeepCollectionEquality().hash(_this.filteredRecords),_this.filter,_this.currentPage,_this.pageSize,_this.hasMore,_this.isLoadingMore,_this.errorMessage);
}

@override
String toString() {
  final _this = this as AttendanceHistoryState;
  return 'AttendanceHistoryState(status: ${_this.status}, records: ${_this.records}, filteredRecords: ${_this.filteredRecords}, filter: ${_this.filter}, currentPage: ${_this.currentPage}, pageSize: ${_this.pageSize}, hasMore: ${_this.hasMore}, isLoadingMore: ${_this.isLoadingMore}, errorMessage: ${_this.errorMessage})';
}


}

/// @nodoc
abstract mixin class $AttendanceHistoryStateCopyWith<$Res>  {
  factory $AttendanceHistoryStateCopyWith(AttendanceHistoryState value, $Res Function(AttendanceHistoryState) _then) = _$AttendanceHistoryStateCopyWithImpl;
@useResult
$Res call({
 UIStatus status, List<AttendanceRecord> records, List<AttendanceRecord> filteredRecords, AttendanceFilter? filter, int currentPage, int pageSize, bool hasMore, bool isLoadingMore, String? errorMessage
});


$AttendanceFilterCopyWith<$Res>? get filter;

}
/// @nodoc
class _$AttendanceHistoryStateCopyWithImpl<$Res>
    implements $AttendanceHistoryStateCopyWith<$Res> {
  _$AttendanceHistoryStateCopyWithImpl(this._self, this._then);

  final AttendanceHistoryState _self;
  final $Res Function(AttendanceHistoryState) _then;

/// Create a copy of AttendanceHistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? records = null,Object? filteredRecords = null,Object? filter = freezed,Object? currentPage = null,Object? pageSize = null,Object? hasMore = null,Object? isLoadingMore = null,Object? errorMessage = freezed,}) {
  return _then(AttendanceHistoryState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UIStatus,records: null == records ? _self.records : records // ignore: cast_nullable_to_non_nullable
as List<AttendanceRecord>,filteredRecords: null == filteredRecords ? _self.filteredRecords : filteredRecords // ignore: cast_nullable_to_non_nullable
as List<AttendanceRecord>,filter: freezed == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as AttendanceFilter?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of AttendanceHistoryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttendanceFilterCopyWith<$Res>? get filter {
    if (_self.filter == null) {
    return null;
  }

  return $AttendanceFilterCopyWith<$Res>(_self.filter!, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}


/// Adds pattern-matching-related methods to [AttendanceHistoryState].
extension AttendanceHistoryStatePatterns on AttendanceHistoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceHistoryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceHistoryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceHistoryState value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceHistoryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceHistoryState value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceHistoryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UIStatus status,  List<AttendanceRecord> records,  List<AttendanceRecord> filteredRecords,  AttendanceFilter? filter,  int currentPage,  int pageSize,  bool hasMore,  bool isLoadingMore,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttendanceHistoryState() when $default != null:
return $default(_that.status,_that.records,_that.filteredRecords,_that.filter,_that.currentPage,_that.pageSize,_that.hasMore,_that.isLoadingMore,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UIStatus status,  List<AttendanceRecord> records,  List<AttendanceRecord> filteredRecords,  AttendanceFilter? filter,  int currentPage,  int pageSize,  bool hasMore,  bool isLoadingMore,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _AttendanceHistoryState():
return $default(_that.status,_that.records,_that.filteredRecords,_that.filter,_that.currentPage,_that.pageSize,_that.hasMore,_that.isLoadingMore,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UIStatus status,  List<AttendanceRecord> records,  List<AttendanceRecord> filteredRecords,  AttendanceFilter? filter,  int currentPage,  int pageSize,  bool hasMore,  bool isLoadingMore,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _AttendanceHistoryState() when $default != null:
return $default(_that.status,_that.records,_that.filteredRecords,_that.filter,_that.currentPage,_that.pageSize,_that.hasMore,_that.isLoadingMore,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _AttendanceHistoryState implements AttendanceHistoryState {
  const _AttendanceHistoryState({this.status = UIStatus.initial,  List<AttendanceRecord> records = const [],  List<AttendanceRecord> filteredRecords = const [], this.filter, this.currentPage = 1, this.pageSize = 20, this.hasMore = false, this.isLoadingMore = false, this.errorMessage}): _records = records,_filteredRecords = filteredRecords;
  

@override@JsonKey() final  UIStatus status;
 final  List<AttendanceRecord> _records;
@override@JsonKey() List<AttendanceRecord> get records {
  if (_records is EqualUnmodifiableListView) return _records;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_records);
}

 final  List<AttendanceRecord> _filteredRecords;
@override@JsonKey() List<AttendanceRecord> get filteredRecords {
  if (_filteredRecords is EqualUnmodifiableListView) return _filteredRecords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filteredRecords);
}

@override final  AttendanceFilter? filter;
@override@JsonKey() final  int currentPage;
@override@JsonKey() final  int pageSize;
@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  bool isLoadingMore;
@override final  String? errorMessage;

/// Create a copy of AttendanceHistoryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceHistoryStateCopyWith<_AttendanceHistoryState> get copyWith => __$AttendanceHistoryStateCopyWithImpl<_AttendanceHistoryState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceHistoryState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.records, _records)&&const DeepCollectionEquality().equals(other.filteredRecords, _filteredRecords)&&(identical(other.filter, filter) || other.filter == filter)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_records),const DeepCollectionEquality().hash(_filteredRecords),filter,currentPage,pageSize,hasMore,isLoadingMore,errorMessage);
}

@override
String toString() {
    return 'AttendanceHistoryState(status: $status, records: $records, filteredRecords: $filteredRecords, filter: $filter, currentPage: $currentPage, pageSize: $pageSize, hasMore: $hasMore, isLoadingMore: $isLoadingMore, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$AttendanceHistoryStateCopyWith<$Res> implements $AttendanceHistoryStateCopyWith<$Res> {
  factory _$AttendanceHistoryStateCopyWith(_AttendanceHistoryState value, $Res Function(_AttendanceHistoryState) _then) = __$AttendanceHistoryStateCopyWithImpl;
@override @useResult
$Res call({
 UIStatus status, List<AttendanceRecord> records, List<AttendanceRecord> filteredRecords, AttendanceFilter? filter, int currentPage, int pageSize, bool hasMore, bool isLoadingMore, String? errorMessage
});


@override $AttendanceFilterCopyWith<$Res>? get filter;

}
/// @nodoc
class __$AttendanceHistoryStateCopyWithImpl<$Res>
    implements _$AttendanceHistoryStateCopyWith<$Res> {
  __$AttendanceHistoryStateCopyWithImpl(this._self, this._then);

  final _AttendanceHistoryState _self;
  final $Res Function(_AttendanceHistoryState) _then;

/// Create a copy of AttendanceHistoryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? records = null,Object? filteredRecords = null,Object? filter = freezed,Object? currentPage = null,Object? pageSize = null,Object? hasMore = null,Object? isLoadingMore = null,Object? errorMessage = freezed,}) {
  return _then(_AttendanceHistoryState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UIStatus,records: null == records ? _self._records : records // ignore: cast_nullable_to_non_nullable
as List<AttendanceRecord>,filteredRecords: null == filteredRecords ? _self._filteredRecords : filteredRecords // ignore: cast_nullable_to_non_nullable
as List<AttendanceRecord>,filter: freezed == filter ? _self.filter : filter // ignore: cast_nullable_to_non_nullable
as AttendanceFilter?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of AttendanceHistoryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttendanceFilterCopyWith<$Res>? get filter {
    if (_self.filter == null) {
    return null;
  }

  return $AttendanceFilterCopyWith<$Res>(_self.filter!, (value) {
    return _then(_self.copyWith(filter: value));
  });
}
}

// dart format on
