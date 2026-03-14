// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OfflineSmsState {

 bool get isLoading; bool get success; String get message; String get phone; int get maxCharacters; String? get error; bool get shouldCloseDialog;
/// Create a copy of OfflineSmsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfflineSmsStateCopyWith<OfflineSmsState> get copyWith => _$OfflineSmsStateCopyWithImpl<OfflineSmsState>(this as OfflineSmsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfflineSmsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.maxCharacters, maxCharacters) || other.maxCharacters == maxCharacters)&&(identical(other.error, error) || other.error == error)&&(identical(other.shouldCloseDialog, shouldCloseDialog) || other.shouldCloseDialog == shouldCloseDialog));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,success,message,phone,maxCharacters,error,shouldCloseDialog);

@override
String toString() {
  return 'OfflineSmsState(isLoading: $isLoading, success: $success, message: $message, phone: $phone, maxCharacters: $maxCharacters, error: $error, shouldCloseDialog: $shouldCloseDialog)';
}


}

/// @nodoc
abstract mixin class $OfflineSmsStateCopyWith<$Res>  {
  factory $OfflineSmsStateCopyWith(OfflineSmsState value, $Res Function(OfflineSmsState) _then) = _$OfflineSmsStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, bool success, String message, String phone, int maxCharacters, String? error, bool shouldCloseDialog
});




}
/// @nodoc
class _$OfflineSmsStateCopyWithImpl<$Res>
    implements $OfflineSmsStateCopyWith<$Res> {
  _$OfflineSmsStateCopyWithImpl(this._self, this._then);

  final OfflineSmsState _self;
  final $Res Function(OfflineSmsState) _then;

/// Create a copy of OfflineSmsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? success = null,Object? message = null,Object? phone = null,Object? maxCharacters = null,Object? error = freezed,Object? shouldCloseDialog = null,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,maxCharacters: null == maxCharacters ? _self.maxCharacters : maxCharacters // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,shouldCloseDialog: null == shouldCloseDialog ? _self.shouldCloseDialog : shouldCloseDialog // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [OfflineSmsState].
extension OfflineSmsStatePatterns on OfflineSmsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OfflineSmsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OfflineSmsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OfflineSmsState value)  $default,){
final _that = this;
switch (_that) {
case _OfflineSmsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OfflineSmsState value)?  $default,){
final _that = this;
switch (_that) {
case _OfflineSmsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  bool success,  String message,  String phone,  int maxCharacters,  String? error,  bool shouldCloseDialog)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OfflineSmsState() when $default != null:
return $default(_that.isLoading,_that.success,_that.message,_that.phone,_that.maxCharacters,_that.error,_that.shouldCloseDialog);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  bool success,  String message,  String phone,  int maxCharacters,  String? error,  bool shouldCloseDialog)  $default,) {final _that = this;
switch (_that) {
case _OfflineSmsState():
return $default(_that.isLoading,_that.success,_that.message,_that.phone,_that.maxCharacters,_that.error,_that.shouldCloseDialog);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  bool success,  String message,  String phone,  int maxCharacters,  String? error,  bool shouldCloseDialog)?  $default,) {final _that = this;
switch (_that) {
case _OfflineSmsState() when $default != null:
return $default(_that.isLoading,_that.success,_that.message,_that.phone,_that.maxCharacters,_that.error,_that.shouldCloseDialog);case _:
  return null;

}
}

}

/// @nodoc


class _OfflineSmsState implements OfflineSmsState {
  const _OfflineSmsState({this.isLoading = false, this.success = false, this.message = '', this.phone = '', this.maxCharacters = 160, this.error, this.shouldCloseDialog = false});
  

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool success;
@override@JsonKey() final  String message;
@override@JsonKey() final  String phone;
@override@JsonKey() final  int maxCharacters;
@override final  String? error;
@override@JsonKey() final  bool shouldCloseDialog;

/// Create a copy of OfflineSmsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OfflineSmsStateCopyWith<_OfflineSmsState> get copyWith => __$OfflineSmsStateCopyWithImpl<_OfflineSmsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OfflineSmsState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.maxCharacters, maxCharacters) || other.maxCharacters == maxCharacters)&&(identical(other.error, error) || other.error == error)&&(identical(other.shouldCloseDialog, shouldCloseDialog) || other.shouldCloseDialog == shouldCloseDialog));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,success,message,phone,maxCharacters,error,shouldCloseDialog);

@override
String toString() {
  return 'OfflineSmsState(isLoading: $isLoading, success: $success, message: $message, phone: $phone, maxCharacters: $maxCharacters, error: $error, shouldCloseDialog: $shouldCloseDialog)';
}


}

/// @nodoc
abstract mixin class _$OfflineSmsStateCopyWith<$Res> implements $OfflineSmsStateCopyWith<$Res> {
  factory _$OfflineSmsStateCopyWith(_OfflineSmsState value, $Res Function(_OfflineSmsState) _then) = __$OfflineSmsStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, bool success, String message, String phone, int maxCharacters, String? error, bool shouldCloseDialog
});




}
/// @nodoc
class __$OfflineSmsStateCopyWithImpl<$Res>
    implements _$OfflineSmsStateCopyWith<$Res> {
  __$OfflineSmsStateCopyWithImpl(this._self, this._then);

  final _OfflineSmsState _self;
  final $Res Function(_OfflineSmsState) _then;

/// Create a copy of OfflineSmsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? success = null,Object? message = null,Object? phone = null,Object? maxCharacters = null,Object? error = freezed,Object? shouldCloseDialog = null,}) {
  return _then(_OfflineSmsState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,maxCharacters: null == maxCharacters ? _self.maxCharacters : maxCharacters // ignore: cast_nullable_to_non_nullable
as int,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,shouldCloseDialog: null == shouldCloseDialog ? _self.shouldCloseDialog : shouldCloseDialog // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
