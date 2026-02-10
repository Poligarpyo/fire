// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trade_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TradeModel _$TradeModelFromJson(Map<String, dynamic> json) => _TradeModel(
      currentPrice: (json['currentPrice'] as num).toDouble(),
      comment: json['comment'] as String?,
      digits: (json['digits'] as num).toInt(),
      login: (json['login'] as num).toInt(),
      openPrice: (json['openPrice'] as num).toDouble(),
      openTime: json['openTime'] as String,
      profit: (json['profit'] as num).toDouble(),
      sl: (json['sl'] as num).toDouble(),
      swaps: (json['swaps'] as num).toDouble(),
      symbol: json['symbol'] as String,
      tp: (json['tp'] as num).toDouble(),
      ticket: (json['ticket'] as num).toInt(),
      type: (json['type'] as num).toInt(),
      volume: (json['volume'] as num).toDouble(),
    );

Map<String, dynamic> _$TradeModelToJson(_TradeModel instance) =>
    <String, dynamic>{
      'currentPrice': instance.currentPrice,
      'comment': instance.comment,
      'digits': instance.digits,
      'login': instance.login,
      'openPrice': instance.openPrice,
      'openTime': instance.openTime,
      'profit': instance.profit,
      'sl': instance.sl,
      'swaps': instance.swaps,
      'symbol': instance.symbol,
      'tp': instance.tp,
      'ticket': instance.ticket,
      'type': instance.type,
      'volume': instance.volume,
    };
