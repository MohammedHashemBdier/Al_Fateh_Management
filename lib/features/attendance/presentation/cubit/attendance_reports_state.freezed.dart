// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_reports_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AttendanceReportsState {

 UIStatus get status; ReportPeriod get period; DateTimeRange<DateTime>? get dateRange; AttendanceReportSummary? get summary; List<AttendanceReportEntry> get entries; String? get errorMessage;
/// Create a copy of AttendanceReportsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceReportsStateCopyWith<AttendanceReportsState> get copyWith => _$AttendanceReportsStateCopyWithImpl<AttendanceReportsState>(this as AttendanceReportsState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AttendanceReportsState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceReportsState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.period, _this.period) || other.period == _this.period)&&(identical(other.dateRange, _this.dateRange) || other.dateRange == _this.dateRange)&&(identical(other.summary, _this.summary) || other.summary == _this.summary)&&const DeepCollectionEquality().equals(other.entries, _this.entries)&&(identical(other.errorMessage, _this.errorMessage) || other.errorMessage == _this.errorMessage));
}


@override
int get hashCode {
  final _this = this as AttendanceReportsState;
  return Object.hash(runtimeType,_this.status,_this.period,_this.dateRange,_this.summary,const DeepCollectionEquality().hash(_this.entries),_this.errorMessage);
}

@override
String toString() {
  final _this = this as AttendanceReportsState;
  return 'AttendanceReportsState(status: ${_this.status}, period: ${_this.period}, dateRange: ${_this.dateRange}, summary: ${_this.summary}, entries: ${_this.entries}, errorMessage: ${_this.errorMessage})';
}


}

/// @nodoc
abstract mixin class $AttendanceReportsStateCopyWith<$Res>  {
  factory $AttendanceReportsStateCopyWith(AttendanceReportsState value, $Res Function(AttendanceReportsState) _then) = _$AttendanceReportsStateCopyWithImpl;
@useResult
$Res call({
 UIStatus status, ReportPeriod period, DateTimeRange<DateTime>? dateRange, AttendanceReportSummary? summary, List<AttendanceReportEntry> entries, String? errorMessage
});


$AttendanceReportSummaryCopyWith<$Res>? get summary;

}
/// @nodoc
class _$AttendanceReportsStateCopyWithImpl<$Res>
    implements $AttendanceReportsStateCopyWith<$Res> {
  _$AttendanceReportsStateCopyWithImpl(this._self, this._then);

  final AttendanceReportsState _self;
  final $Res Function(AttendanceReportsState) _then;

/// Create a copy of AttendanceReportsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? period = null,Object? dateRange = freezed,Object? summary = freezed,Object? entries = null,Object? errorMessage = freezed,}) {
  return _then(AttendanceReportsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UIStatus,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as ReportPeriod,dateRange: freezed == dateRange ? _self.dateRange : dateRange // ignore: cast_nullable_to_non_nullable
as DateTimeRange<DateTime>?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as AttendanceReportSummary?,entries: null == entries ? _self.entries : entries // ignore: cast_nullable_to_non_nullable
as List<AttendanceReportEntry>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of AttendanceReportsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttendanceReportSummaryCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $AttendanceReportSummaryCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [AttendanceReportsState].
extension AttendanceReportsStatePatterns on AttendanceReportsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceReportsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceReportsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceReportsState value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceReportsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceReportsState value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceReportsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UIStatus status,  ReportPeriod period,  DateTimeRange<DateTime>? dateRange,  AttendanceReportSummary? summary,  List<AttendanceReportEntry> entries,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttendanceReportsState() when $default != null:
return $default(_that.status,_that.period,_that.dateRange,_that.summary,_that.entries,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UIStatus status,  ReportPeriod period,  DateTimeRange<DateTime>? dateRange,  AttendanceReportSummary? summary,  List<AttendanceReportEntry> entries,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _AttendanceReportsState():
return $default(_that.status,_that.period,_that.dateRange,_that.summary,_that.entries,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UIStatus status,  ReportPeriod period,  DateTimeRange<DateTime>? dateRange,  AttendanceReportSummary? summary,  List<AttendanceReportEntry> entries,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _AttendanceReportsState() when $default != null:
return $default(_that.status,_that.period,_that.dateRange,_that.summary,_that.entries,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _AttendanceReportsState implements AttendanceReportsState {
  const _AttendanceReportsState({this.status = UIStatus.initial, this.period = ReportPeriod.monthly, this.dateRange, this.summary,  List<AttendanceReportEntry> entries = const [], this.errorMessage}): _entries = entries;
  

@override@JsonKey() final  UIStatus status;
@override@JsonKey() final  ReportPeriod period;
@override final  DateTimeRange<DateTime>? dateRange;
@override final  AttendanceReportSummary? summary;
 final  List<AttendanceReportEntry> _entries;
@override@JsonKey() List<AttendanceReportEntry> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}

@override final  String? errorMessage;

/// Create a copy of AttendanceReportsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceReportsStateCopyWith<_AttendanceReportsState> get copyWith => __$AttendanceReportsStateCopyWithImpl<_AttendanceReportsState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceReportsState&&(identical(other.status, status) || other.status == status)&&(identical(other.period, period) || other.period == period)&&(identical(other.dateRange, dateRange) || other.dateRange == dateRange)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.entries, _entries)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,period,dateRange,summary,const DeepCollectionEquality().hash(_entries),errorMessage);
}

@override
String toString() {
    return 'AttendanceReportsState(status: $status, period: $period, dateRange: $dateRange, summary: $summary, entries: $entries, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$AttendanceReportsStateCopyWith<$Res> implements $AttendanceReportsStateCopyWith<$Res> {
  factory _$AttendanceReportsStateCopyWith(_AttendanceReportsState value, $Res Function(_AttendanceReportsState) _then) = __$AttendanceReportsStateCopyWithImpl;
@override @useResult
$Res call({
 UIStatus status, ReportPeriod period, DateTimeRange<DateTime>? dateRange, AttendanceReportSummary? summary, List<AttendanceReportEntry> entries, String? errorMessage
});


@override $AttendanceReportSummaryCopyWith<$Res>? get summary;

}
/// @nodoc
class __$AttendanceReportsStateCopyWithImpl<$Res>
    implements _$AttendanceReportsStateCopyWith<$Res> {
  __$AttendanceReportsStateCopyWithImpl(this._self, this._then);

  final _AttendanceReportsState _self;
  final $Res Function(_AttendanceReportsState) _then;

/// Create a copy of AttendanceReportsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? period = null,Object? dateRange = freezed,Object? summary = freezed,Object? entries = null,Object? errorMessage = freezed,}) {
  return _then(_AttendanceReportsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UIStatus,period: null == period ? _self.period : period // ignore: cast_nullable_to_non_nullable
as ReportPeriod,dateRange: freezed == dateRange ? _self.dateRange : dateRange // ignore: cast_nullable_to_non_nullable
as DateTimeRange<DateTime>?,summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as AttendanceReportSummary?,entries: null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<AttendanceReportEntry>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of AttendanceReportsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AttendanceReportSummaryCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $AttendanceReportSummaryCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}

// dart format on
