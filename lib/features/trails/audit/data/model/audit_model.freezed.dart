// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuditModel {
  @JsonKey(name: 'trail_id')
  int get trailId;
  @JsonKey(name: 'date_entered')
  String get dateEntered;
  @JsonKey(name: 'day_only')
  String get dayOnly;
  @JsonKey(name: 'month')
  String get month;
  @JsonKey(name: 'year')
  String get year;
  @JsonKey(name: 'activity')
  String get activity;
  @JsonKey(name: 'action_display')
  String get actionDisplay;
  @JsonKey(name: 'dept_name')
  String get deptName;
  @JsonKey(name: 'emp_fname')
  String get empFname;
  @JsonKey(name: 'emp_lname')
  String get empLname;
  @JsonKey(name: 'emp_mname')
  String get empMname;

  /// Create a copy of AuditModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuditModelCopyWith<AuditModel> get copyWith =>
      _$AuditModelCopyWithImpl<AuditModel>(this as AuditModel, _$identity);

  /// Serializes this AuditModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuditModel &&
            (identical(other.trailId, trailId) || other.trailId == trailId) &&
            (identical(other.dateEntered, dateEntered) ||
                other.dateEntered == dateEntered) &&
            (identical(other.dayOnly, dayOnly) || other.dayOnly == dayOnly) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            (identical(other.actionDisplay, actionDisplay) ||
                other.actionDisplay == actionDisplay) &&
            (identical(other.deptName, deptName) ||
                other.deptName == deptName) &&
            (identical(other.empFname, empFname) ||
                other.empFname == empFname) &&
            (identical(other.empLname, empLname) ||
                other.empLname == empLname) &&
            (identical(other.empMname, empMname) ||
                other.empMname == empMname));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      trailId,
      dateEntered,
      dayOnly,
      month,
      year,
      activity,
      actionDisplay,
      deptName,
      empFname,
      empLname,
      empMname);

  @override
  String toString() {
    return 'AuditModel(trailId: $trailId, dateEntered: $dateEntered, dayOnly: $dayOnly, month: $month, year: $year, activity: $activity, actionDisplay: $actionDisplay, deptName: $deptName, empFname: $empFname, empLname: $empLname, empMname: $empMname)';
  }
}

/// @nodoc
abstract mixin class $AuditModelCopyWith<$Res> {
  factory $AuditModelCopyWith(
          AuditModel value, $Res Function(AuditModel) _then) =
      _$AuditModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'trail_id') int trailId,
      @JsonKey(name: 'date_entered') String dateEntered,
      @JsonKey(name: 'day_only') String dayOnly,
      @JsonKey(name: 'month') String month,
      @JsonKey(name: 'year') String year,
      @JsonKey(name: 'activity') String activity,
      @JsonKey(name: 'action_display') String actionDisplay,
      @JsonKey(name: 'dept_name') String deptName,
      @JsonKey(name: 'emp_fname') String empFname,
      @JsonKey(name: 'emp_lname') String empLname,
      @JsonKey(name: 'emp_mname') String empMname});
}

/// @nodoc
class _$AuditModelCopyWithImpl<$Res> implements $AuditModelCopyWith<$Res> {
  _$AuditModelCopyWithImpl(this._self, this._then);

  final AuditModel _self;
  final $Res Function(AuditModel) _then;

  /// Create a copy of AuditModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? trailId = null,
    Object? dateEntered = null,
    Object? dayOnly = null,
    Object? month = null,
    Object? year = null,
    Object? activity = null,
    Object? actionDisplay = null,
    Object? deptName = null,
    Object? empFname = null,
    Object? empLname = null,
    Object? empMname = null,
  }) {
    return _then(_self.copyWith(
      trailId: null == trailId
          ? _self.trailId
          : trailId // ignore: cast_nullable_to_non_nullable
              as int,
      dateEntered: null == dateEntered
          ? _self.dateEntered
          : dateEntered // ignore: cast_nullable_to_non_nullable
              as String,
      dayOnly: null == dayOnly
          ? _self.dayOnly
          : dayOnly // ignore: cast_nullable_to_non_nullable
              as String,
      month: null == month
          ? _self.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _self.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      activity: null == activity
          ? _self.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as String,
      actionDisplay: null == actionDisplay
          ? _self.actionDisplay
          : actionDisplay // ignore: cast_nullable_to_non_nullable
              as String,
      deptName: null == deptName
          ? _self.deptName
          : deptName // ignore: cast_nullable_to_non_nullable
              as String,
      empFname: null == empFname
          ? _self.empFname
          : empFname // ignore: cast_nullable_to_non_nullable
              as String,
      empLname: null == empLname
          ? _self.empLname
          : empLname // ignore: cast_nullable_to_non_nullable
              as String,
      empMname: null == empMname
          ? _self.empMname
          : empMname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [AuditModel].
extension AuditModelPatterns on AuditModel {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AuditModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuditModel() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AuditModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuditModel():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AuditModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuditModel() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'trail_id') int trailId,
            @JsonKey(name: 'date_entered') String dateEntered,
            @JsonKey(name: 'day_only') String dayOnly,
            @JsonKey(name: 'month') String month,
            @JsonKey(name: 'year') String year,
            @JsonKey(name: 'activity') String activity,
            @JsonKey(name: 'action_display') String actionDisplay,
            @JsonKey(name: 'dept_name') String deptName,
            @JsonKey(name: 'emp_fname') String empFname,
            @JsonKey(name: 'emp_lname') String empLname,
            @JsonKey(name: 'emp_mname') String empMname)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AuditModel() when $default != null:
        return $default(
            _that.trailId,
            _that.dateEntered,
            _that.dayOnly,
            _that.month,
            _that.year,
            _that.activity,
            _that.actionDisplay,
            _that.deptName,
            _that.empFname,
            _that.empLname,
            _that.empMname);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'trail_id') int trailId,
            @JsonKey(name: 'date_entered') String dateEntered,
            @JsonKey(name: 'day_only') String dayOnly,
            @JsonKey(name: 'month') String month,
            @JsonKey(name: 'year') String year,
            @JsonKey(name: 'activity') String activity,
            @JsonKey(name: 'action_display') String actionDisplay,
            @JsonKey(name: 'dept_name') String deptName,
            @JsonKey(name: 'emp_fname') String empFname,
            @JsonKey(name: 'emp_lname') String empLname,
            @JsonKey(name: 'emp_mname') String empMname)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuditModel():
        return $default(
            _that.trailId,
            _that.dateEntered,
            _that.dayOnly,
            _that.month,
            _that.year,
            _that.activity,
            _that.actionDisplay,
            _that.deptName,
            _that.empFname,
            _that.empLname,
            _that.empMname);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(name: 'trail_id') int trailId,
            @JsonKey(name: 'date_entered') String dateEntered,
            @JsonKey(name: 'day_only') String dayOnly,
            @JsonKey(name: 'month') String month,
            @JsonKey(name: 'year') String year,
            @JsonKey(name: 'activity') String activity,
            @JsonKey(name: 'action_display') String actionDisplay,
            @JsonKey(name: 'dept_name') String deptName,
            @JsonKey(name: 'emp_fname') String empFname,
            @JsonKey(name: 'emp_lname') String empLname,
            @JsonKey(name: 'emp_mname') String empMname)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AuditModel() when $default != null:
        return $default(
            _that.trailId,
            _that.dateEntered,
            _that.dayOnly,
            _that.month,
            _that.year,
            _that.activity,
            _that.actionDisplay,
            _that.deptName,
            _that.empFname,
            _that.empLname,
            _that.empMname);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AuditModel implements AuditModel {
  const _AuditModel(
      {@JsonKey(name: 'trail_id') required this.trailId,
      @JsonKey(name: 'date_entered') required this.dateEntered,
      @JsonKey(name: 'day_only') required this.dayOnly,
      @JsonKey(name: 'month') required this.month,
      @JsonKey(name: 'year') required this.year,
      @JsonKey(name: 'activity') required this.activity,
      @JsonKey(name: 'action_display') required this.actionDisplay,
      @JsonKey(name: 'dept_name') required this.deptName,
      @JsonKey(name: 'emp_fname') required this.empFname,
      @JsonKey(name: 'emp_lname') required this.empLname,
      @JsonKey(name: 'emp_mname') required this.empMname});
  factory _AuditModel.fromJson(Map<String, dynamic> json) =>
      _$AuditModelFromJson(json);

  @override
  @JsonKey(name: 'trail_id')
  final int trailId;
  @override
  @JsonKey(name: 'date_entered')
  final String dateEntered;
  @override
  @JsonKey(name: 'day_only')
  final String dayOnly;
  @override
  @JsonKey(name: 'month')
  final String month;
  @override
  @JsonKey(name: 'year')
  final String year;
  @override
  @JsonKey(name: 'activity')
  final String activity;
  @override
  @JsonKey(name: 'action_display')
  final String actionDisplay;
  @override
  @JsonKey(name: 'dept_name')
  final String deptName;
  @override
  @JsonKey(name: 'emp_fname')
  final String empFname;
  @override
  @JsonKey(name: 'emp_lname')
  final String empLname;
  @override
  @JsonKey(name: 'emp_mname')
  final String empMname;

  /// Create a copy of AuditModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AuditModelCopyWith<_AuditModel> get copyWith =>
      __$AuditModelCopyWithImpl<_AuditModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AuditModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AuditModel &&
            (identical(other.trailId, trailId) || other.trailId == trailId) &&
            (identical(other.dateEntered, dateEntered) ||
                other.dateEntered == dateEntered) &&
            (identical(other.dayOnly, dayOnly) || other.dayOnly == dayOnly) &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.activity, activity) ||
                other.activity == activity) &&
            (identical(other.actionDisplay, actionDisplay) ||
                other.actionDisplay == actionDisplay) &&
            (identical(other.deptName, deptName) ||
                other.deptName == deptName) &&
            (identical(other.empFname, empFname) ||
                other.empFname == empFname) &&
            (identical(other.empLname, empLname) ||
                other.empLname == empLname) &&
            (identical(other.empMname, empMname) ||
                other.empMname == empMname));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      trailId,
      dateEntered,
      dayOnly,
      month,
      year,
      activity,
      actionDisplay,
      deptName,
      empFname,
      empLname,
      empMname);

  @override
  String toString() {
    return 'AuditModel(trailId: $trailId, dateEntered: $dateEntered, dayOnly: $dayOnly, month: $month, year: $year, activity: $activity, actionDisplay: $actionDisplay, deptName: $deptName, empFname: $empFname, empLname: $empLname, empMname: $empMname)';
  }
}

/// @nodoc
abstract mixin class _$AuditModelCopyWith<$Res>
    implements $AuditModelCopyWith<$Res> {
  factory _$AuditModelCopyWith(
          _AuditModel value, $Res Function(_AuditModel) _then) =
      __$AuditModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'trail_id') int trailId,
      @JsonKey(name: 'date_entered') String dateEntered,
      @JsonKey(name: 'day_only') String dayOnly,
      @JsonKey(name: 'month') String month,
      @JsonKey(name: 'year') String year,
      @JsonKey(name: 'activity') String activity,
      @JsonKey(name: 'action_display') String actionDisplay,
      @JsonKey(name: 'dept_name') String deptName,
      @JsonKey(name: 'emp_fname') String empFname,
      @JsonKey(name: 'emp_lname') String empLname,
      @JsonKey(name: 'emp_mname') String empMname});
}

/// @nodoc
class __$AuditModelCopyWithImpl<$Res> implements _$AuditModelCopyWith<$Res> {
  __$AuditModelCopyWithImpl(this._self, this._then);

  final _AuditModel _self;
  final $Res Function(_AuditModel) _then;

  /// Create a copy of AuditModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? trailId = null,
    Object? dateEntered = null,
    Object? dayOnly = null,
    Object? month = null,
    Object? year = null,
    Object? activity = null,
    Object? actionDisplay = null,
    Object? deptName = null,
    Object? empFname = null,
    Object? empLname = null,
    Object? empMname = null,
  }) {
    return _then(_AuditModel(
      trailId: null == trailId
          ? _self.trailId
          : trailId // ignore: cast_nullable_to_non_nullable
              as int,
      dateEntered: null == dateEntered
          ? _self.dateEntered
          : dateEntered // ignore: cast_nullable_to_non_nullable
              as String,
      dayOnly: null == dayOnly
          ? _self.dayOnly
          : dayOnly // ignore: cast_nullable_to_non_nullable
              as String,
      month: null == month
          ? _self.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _self.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      activity: null == activity
          ? _self.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as String,
      actionDisplay: null == actionDisplay
          ? _self.actionDisplay
          : actionDisplay // ignore: cast_nullable_to_non_nullable
              as String,
      deptName: null == deptName
          ? _self.deptName
          : deptName // ignore: cast_nullable_to_non_nullable
              as String,
      empFname: null == empFname
          ? _self.empFname
          : empFname // ignore: cast_nullable_to_non_nullable
              as String,
      empLname: null == empLname
          ? _self.empLname
          : empLname // ignore: cast_nullable_to_non_nullable
              as String,
      empMname: null == empMname
          ? _self.empMname
          : empMname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
