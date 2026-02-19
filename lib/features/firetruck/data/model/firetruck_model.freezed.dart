// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'firetruck_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FireTruckModel {

 double get latitude; double get longitude; String get incidentType; String get severityLevel; String get additionalDetails;
/// Create a copy of FireTruckModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FireTruckModelCopyWith<FireTruckModel> get copyWith => _$FireTruckModelCopyWithImpl<FireTruckModel>(this as FireTruckModel, _$identity);

  /// Serializes this FireTruckModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FireTruckModel&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.incidentType, incidentType) || other.incidentType == incidentType)&&(identical(other.severityLevel, severityLevel) || other.severityLevel == severityLevel)&&(identical(other.additionalDetails, additionalDetails) || other.additionalDetails == additionalDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latitude,longitude,incidentType,severityLevel,additionalDetails);

@override
String toString() {
  return 'FireTruckModel(latitude: $latitude, longitude: $longitude, incidentType: $incidentType, severityLevel: $severityLevel, additionalDetails: $additionalDetails)';
}


}

/// @nodoc
abstract mixin class $FireTruckModelCopyWith<$Res>  {
  factory $FireTruckModelCopyWith(FireTruckModel value, $Res Function(FireTruckModel) _then) = _$FireTruckModelCopyWithImpl;
@useResult
$Res call({
 double latitude, double longitude, String incidentType, String severityLevel, String additionalDetails
});




}
/// @nodoc
class _$FireTruckModelCopyWithImpl<$Res>
    implements $FireTruckModelCopyWith<$Res> {
  _$FireTruckModelCopyWithImpl(this._self, this._then);

  final FireTruckModel _self;
  final $Res Function(FireTruckModel) _then;

/// Create a copy of FireTruckModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? latitude = null,Object? longitude = null,Object? incidentType = null,Object? severityLevel = null,Object? additionalDetails = null,}) {
  return _then(_self.copyWith(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,incidentType: null == incidentType ? _self.incidentType : incidentType // ignore: cast_nullable_to_non_nullable
as String,severityLevel: null == severityLevel ? _self.severityLevel : severityLevel // ignore: cast_nullable_to_non_nullable
as String,additionalDetails: null == additionalDetails ? _self.additionalDetails : additionalDetails // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FireTruckModel].
extension FireTruckModelPatterns on FireTruckModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FireTruckModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FireTruckModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FireTruckModel value)  $default,){
final _that = this;
switch (_that) {
case _FireTruckModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FireTruckModel value)?  $default,){
final _that = this;
switch (_that) {
case _FireTruckModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double latitude,  double longitude,  String incidentType,  String severityLevel,  String additionalDetails)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FireTruckModel() when $default != null:
return $default(_that.latitude,_that.longitude,_that.incidentType,_that.severityLevel,_that.additionalDetails);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double latitude,  double longitude,  String incidentType,  String severityLevel,  String additionalDetails)  $default,) {final _that = this;
switch (_that) {
case _FireTruckModel():
return $default(_that.latitude,_that.longitude,_that.incidentType,_that.severityLevel,_that.additionalDetails);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double latitude,  double longitude,  String incidentType,  String severityLevel,  String additionalDetails)?  $default,) {final _that = this;
switch (_that) {
case _FireTruckModel() when $default != null:
return $default(_that.latitude,_that.longitude,_that.incidentType,_that.severityLevel,_that.additionalDetails);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FireTruckModel extends FireTruckModel {
  const _FireTruckModel({required this.latitude, required this.longitude, required this.incidentType, required this.severityLevel, required this.additionalDetails}): super._();
  factory _FireTruckModel.fromJson(Map<String, dynamic> json) => _$FireTruckModelFromJson(json);

@override final  double latitude;
@override final  double longitude;
@override final  String incidentType;
@override final  String severityLevel;
@override final  String additionalDetails;

/// Create a copy of FireTruckModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FireTruckModelCopyWith<_FireTruckModel> get copyWith => __$FireTruckModelCopyWithImpl<_FireTruckModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FireTruckModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FireTruckModel&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.incidentType, incidentType) || other.incidentType == incidentType)&&(identical(other.severityLevel, severityLevel) || other.severityLevel == severityLevel)&&(identical(other.additionalDetails, additionalDetails) || other.additionalDetails == additionalDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latitude,longitude,incidentType,severityLevel,additionalDetails);

@override
String toString() {
  return 'FireTruckModel(latitude: $latitude, longitude: $longitude, incidentType: $incidentType, severityLevel: $severityLevel, additionalDetails: $additionalDetails)';
}


}

/// @nodoc
abstract mixin class _$FireTruckModelCopyWith<$Res> implements $FireTruckModelCopyWith<$Res> {
  factory _$FireTruckModelCopyWith(_FireTruckModel value, $Res Function(_FireTruckModel) _then) = __$FireTruckModelCopyWithImpl;
@override @useResult
$Res call({
 double latitude, double longitude, String incidentType, String severityLevel, String additionalDetails
});




}
/// @nodoc
class __$FireTruckModelCopyWithImpl<$Res>
    implements _$FireTruckModelCopyWith<$Res> {
  __$FireTruckModelCopyWithImpl(this._self, this._then);

  final _FireTruckModel _self;
  final $Res Function(_FireTruckModel) _then;

/// Create a copy of FireTruckModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? latitude = null,Object? longitude = null,Object? incidentType = null,Object? severityLevel = null,Object? additionalDetails = null,}) {
  return _then(_FireTruckModel(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,incidentType: null == incidentType ? _self.incidentType : incidentType // ignore: cast_nullable_to_non_nullable
as String,severityLevel: null == severityLevel ? _self.severityLevel : severityLevel // ignore: cast_nullable_to_non_nullable
as String,additionalDetails: null == additionalDetails ? _self.additionalDetails : additionalDetails // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
