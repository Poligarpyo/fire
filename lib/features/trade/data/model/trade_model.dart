import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/trade.dart'; 
part 'trade_model.freezed.dart';
part 'trade_model.g.dart';

@freezed
abstract class TradeModel with _$TradeModel {
  const factory TradeModel({
    @JsonKey(name: 'currentPrice') required double currentPrice,
    String? comment,
    required int digits,
    required int login,
    @JsonKey(name: 'openPrice') required double openPrice,
    @JsonKey(name: 'openTime') required String openTime,
    required double profit,
    required double sl,
    required double swaps,
    required String symbol,
    required double tp,
    required int ticket,
    required int type,
    required double volume,
  }) = _TradeModel;

  factory TradeModel.fromJson(Map<String, dynamic> json) =>
      _$TradeModelFromJson(json);
}

extension TradeModelX on TradeModel {
  // Convert TradeModel to Trade Entity
  Trade toEntity() => Trade(
        currentPrice: currentPrice,
        comment: comment,
        digits: digits,
        login: login,
        openPrice: openPrice,
        openTime: DateTime.parse(openTime), // Convert to DateTime
        profit: profit,
        sl: sl,
        swaps: swaps,
        symbol: symbol,
        tp: tp,
        ticket: ticket,
        type: type,
        volume: volume,
      );
}
