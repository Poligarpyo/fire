// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trade_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TradeModel {
  @JsonKey(name: 'currentPrice')
  double get currentPrice;
  String? get comment;
  int get digits;
  int get login;
  @JsonKey(name: 'openPrice')
  double get openPrice;
  @JsonKey(name: 'openTime')
  String get openTime;
  double get profit;
  double get sl;
  double get swaps;
  String get symbol;
  double get tp;
  int get ticket;
  int get type;
  double get volume;

  /// Create a copy of TradeModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TradeModelCopyWith<TradeModel> get copyWith =>
      _$TradeModelCopyWithImpl<TradeModel>(this as TradeModel, _$identity);

  /// Serializes this TradeModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TradeModel &&
            (identical(other.currentPrice, currentPrice) ||
                other.currentPrice == currentPrice) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.digits, digits) || other.digits == digits) &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.openPrice, openPrice) ||
                other.openPrice == openPrice) &&
            (identical(other.openTime, openTime) ||
                other.openTime == openTime) &&
            (identical(other.profit, profit) || other.profit == profit) &&
            (identical(other.sl, sl) || other.sl == sl) &&
            (identical(other.swaps, swaps) || other.swaps == swaps) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.tp, tp) || other.tp == tp) &&
            (identical(other.ticket, ticket) || other.ticket == ticket) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.volume, volume) || other.volume == volume));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentPrice,
      comment,
      digits,
      login,
      openPrice,
      openTime,
      profit,
      sl,
      swaps,
      symbol,
      tp,
      ticket,
      type,
      volume);

  @override
  String toString() {
    return 'TradeModel(currentPrice: $currentPrice, comment: $comment, digits: $digits, login: $login, openPrice: $openPrice, openTime: $openTime, profit: $profit, sl: $sl, swaps: $swaps, symbol: $symbol, tp: $tp, ticket: $ticket, type: $type, volume: $volume)';
  }
}

/// @nodoc
abstract mixin class $TradeModelCopyWith<$Res> {
  factory $TradeModelCopyWith(
          TradeModel value, $Res Function(TradeModel) _then) =
      _$TradeModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'currentPrice') double currentPrice,
      String? comment,
      int digits,
      int login,
      @JsonKey(name: 'openPrice') double openPrice,
      @JsonKey(name: 'openTime') String openTime,
      double profit,
      double sl,
      double swaps,
      String symbol,
      double tp,
      int ticket,
      int type,
      double volume});
}

/// @nodoc
class _$TradeModelCopyWithImpl<$Res> implements $TradeModelCopyWith<$Res> {
  _$TradeModelCopyWithImpl(this._self, this._then);

  final TradeModel _self;
  final $Res Function(TradeModel) _then;

  /// Create a copy of TradeModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPrice = null,
    Object? comment = freezed,
    Object? digits = null,
    Object? login = null,
    Object? openPrice = null,
    Object? openTime = null,
    Object? profit = null,
    Object? sl = null,
    Object? swaps = null,
    Object? symbol = null,
    Object? tp = null,
    Object? ticket = null,
    Object? type = null,
    Object? volume = null,
  }) {
    return _then(_self.copyWith(
      currentPrice: null == currentPrice
          ? _self.currentPrice
          : currentPrice // ignore: cast_nullable_to_non_nullable
              as double,
      comment: freezed == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      digits: null == digits
          ? _self.digits
          : digits // ignore: cast_nullable_to_non_nullable
              as int,
      login: null == login
          ? _self.login
          : login // ignore: cast_nullable_to_non_nullable
              as int,
      openPrice: null == openPrice
          ? _self.openPrice
          : openPrice // ignore: cast_nullable_to_non_nullable
              as double,
      openTime: null == openTime
          ? _self.openTime
          : openTime // ignore: cast_nullable_to_non_nullable
              as String,
      profit: null == profit
          ? _self.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as double,
      sl: null == sl
          ? _self.sl
          : sl // ignore: cast_nullable_to_non_nullable
              as double,
      swaps: null == swaps
          ? _self.swaps
          : swaps // ignore: cast_nullable_to_non_nullable
              as double,
      symbol: null == symbol
          ? _self.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      tp: null == tp
          ? _self.tp
          : tp // ignore: cast_nullable_to_non_nullable
              as double,
      ticket: null == ticket
          ? _self.ticket
          : ticket // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      volume: null == volume
          ? _self.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [TradeModel].
extension TradeModelPatterns on TradeModel {
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
    TResult Function(_TradeModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TradeModel() when $default != null:
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
    TResult Function(_TradeModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TradeModel():
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
    TResult? Function(_TradeModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TradeModel() when $default != null:
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
            @JsonKey(name: 'currentPrice') double currentPrice,
            String? comment,
            int digits,
            int login,
            @JsonKey(name: 'openPrice') double openPrice,
            @JsonKey(name: 'openTime') String openTime,
            double profit,
            double sl,
            double swaps,
            String symbol,
            double tp,
            int ticket,
            int type,
            double volume)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TradeModel() when $default != null:
        return $default(
            _that.currentPrice,
            _that.comment,
            _that.digits,
            _that.login,
            _that.openPrice,
            _that.openTime,
            _that.profit,
            _that.sl,
            _that.swaps,
            _that.symbol,
            _that.tp,
            _that.ticket,
            _that.type,
            _that.volume);
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
            @JsonKey(name: 'currentPrice') double currentPrice,
            String? comment,
            int digits,
            int login,
            @JsonKey(name: 'openPrice') double openPrice,
            @JsonKey(name: 'openTime') String openTime,
            double profit,
            double sl,
            double swaps,
            String symbol,
            double tp,
            int ticket,
            int type,
            double volume)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TradeModel():
        return $default(
            _that.currentPrice,
            _that.comment,
            _that.digits,
            _that.login,
            _that.openPrice,
            _that.openTime,
            _that.profit,
            _that.sl,
            _that.swaps,
            _that.symbol,
            _that.tp,
            _that.ticket,
            _that.type,
            _that.volume);
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
            @JsonKey(name: 'currentPrice') double currentPrice,
            String? comment,
            int digits,
            int login,
            @JsonKey(name: 'openPrice') double openPrice,
            @JsonKey(name: 'openTime') String openTime,
            double profit,
            double sl,
            double swaps,
            String symbol,
            double tp,
            int ticket,
            int type,
            double volume)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TradeModel() when $default != null:
        return $default(
            _that.currentPrice,
            _that.comment,
            _that.digits,
            _that.login,
            _that.openPrice,
            _that.openTime,
            _that.profit,
            _that.sl,
            _that.swaps,
            _that.symbol,
            _that.tp,
            _that.ticket,
            _that.type,
            _that.volume);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TradeModel implements TradeModel {
  const _TradeModel(
      {@JsonKey(name: 'currentPrice') required this.currentPrice,
      this.comment,
      required this.digits,
      required this.login,
      @JsonKey(name: 'openPrice') required this.openPrice,
      @JsonKey(name: 'openTime') required this.openTime,
      required this.profit,
      required this.sl,
      required this.swaps,
      required this.symbol,
      required this.tp,
      required this.ticket,
      required this.type,
      required this.volume});
  factory _TradeModel.fromJson(Map<String, dynamic> json) =>
      _$TradeModelFromJson(json);

  @override
  @JsonKey(name: 'currentPrice')
  final double currentPrice;
  @override
  final String? comment;
  @override
  final int digits;
  @override
  final int login;
  @override
  @JsonKey(name: 'openPrice')
  final double openPrice;
  @override
  @JsonKey(name: 'openTime')
  final String openTime;
  @override
  final double profit;
  @override
  final double sl;
  @override
  final double swaps;
  @override
  final String symbol;
  @override
  final double tp;
  @override
  final int ticket;
  @override
  final int type;
  @override
  final double volume;

  /// Create a copy of TradeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TradeModelCopyWith<_TradeModel> get copyWith =>
      __$TradeModelCopyWithImpl<_TradeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TradeModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TradeModel &&
            (identical(other.currentPrice, currentPrice) ||
                other.currentPrice == currentPrice) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.digits, digits) || other.digits == digits) &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.openPrice, openPrice) ||
                other.openPrice == openPrice) &&
            (identical(other.openTime, openTime) ||
                other.openTime == openTime) &&
            (identical(other.profit, profit) || other.profit == profit) &&
            (identical(other.sl, sl) || other.sl == sl) &&
            (identical(other.swaps, swaps) || other.swaps == swaps) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.tp, tp) || other.tp == tp) &&
            (identical(other.ticket, ticket) || other.ticket == ticket) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.volume, volume) || other.volume == volume));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentPrice,
      comment,
      digits,
      login,
      openPrice,
      openTime,
      profit,
      sl,
      swaps,
      symbol,
      tp,
      ticket,
      type,
      volume);

  @override
  String toString() {
    return 'TradeModel(currentPrice: $currentPrice, comment: $comment, digits: $digits, login: $login, openPrice: $openPrice, openTime: $openTime, profit: $profit, sl: $sl, swaps: $swaps, symbol: $symbol, tp: $tp, ticket: $ticket, type: $type, volume: $volume)';
  }
}

/// @nodoc
abstract mixin class _$TradeModelCopyWith<$Res>
    implements $TradeModelCopyWith<$Res> {
  factory _$TradeModelCopyWith(
          _TradeModel value, $Res Function(_TradeModel) _then) =
      __$TradeModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'currentPrice') double currentPrice,
      String? comment,
      int digits,
      int login,
      @JsonKey(name: 'openPrice') double openPrice,
      @JsonKey(name: 'openTime') String openTime,
      double profit,
      double sl,
      double swaps,
      String symbol,
      double tp,
      int ticket,
      int type,
      double volume});
}

/// @nodoc
class __$TradeModelCopyWithImpl<$Res> implements _$TradeModelCopyWith<$Res> {
  __$TradeModelCopyWithImpl(this._self, this._then);

  final _TradeModel _self;
  final $Res Function(_TradeModel) _then;

  /// Create a copy of TradeModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentPrice = null,
    Object? comment = freezed,
    Object? digits = null,
    Object? login = null,
    Object? openPrice = null,
    Object? openTime = null,
    Object? profit = null,
    Object? sl = null,
    Object? swaps = null,
    Object? symbol = null,
    Object? tp = null,
    Object? ticket = null,
    Object? type = null,
    Object? volume = null,
  }) {
    return _then(_TradeModel(
      currentPrice: null == currentPrice
          ? _self.currentPrice
          : currentPrice // ignore: cast_nullable_to_non_nullable
              as double,
      comment: freezed == comment
          ? _self.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      digits: null == digits
          ? _self.digits
          : digits // ignore: cast_nullable_to_non_nullable
              as int,
      login: null == login
          ? _self.login
          : login // ignore: cast_nullable_to_non_nullable
              as int,
      openPrice: null == openPrice
          ? _self.openPrice
          : openPrice // ignore: cast_nullable_to_non_nullable
              as double,
      openTime: null == openTime
          ? _self.openTime
          : openTime // ignore: cast_nullable_to_non_nullable
              as String,
      profit: null == profit
          ? _self.profit
          : profit // ignore: cast_nullable_to_non_nullable
              as double,
      sl: null == sl
          ? _self.sl
          : sl // ignore: cast_nullable_to_non_nullable
              as double,
      swaps: null == swaps
          ? _self.swaps
          : swaps // ignore: cast_nullable_to_non_nullable
              as double,
      symbol: null == symbol
          ? _self.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      tp: null == tp
          ? _self.tp
          : tp // ignore: cast_nullable_to_non_nullable
              as double,
      ticket: null == ticket
          ? _self.ticket
          : ticket // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as int,
      volume: null == volume
          ? _self.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
