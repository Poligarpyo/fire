import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/Account.dart';

part 'account_model.freezed.dart';
part 'account_model.g.dart';

@freezed
abstract class AccountModel with _$AccountModel {
  const factory AccountModel({
    required String address,
    required double balance,
    required String city,
    required String country,
    required int currency,
    required int currentTradesCount,
    required double currentTradesVolume,
    required double equity,
    required double freeMargin,
    required bool isAnyOpenTrades,
    required bool isSwapFree,
    required int leverage,
    required String name,
    required String phone,
    required int totalTradesCount,
    required double totalTradesVolume,
    required int type,
    required int verificationLevel,
    required String zipCode,
  }) = _AccountModel;

  factory AccountModel.fromJson(Map<String, dynamic> json) => _$AccountModelFromJson(json);
}

extension AccountModelX on AccountModel {
  Account toEntity() => Account(
        address: address,
        balance: balance,
        city: city,
        country: country,
        currency: currency,
        currentTradesCount: currentTradesCount,
        currentTradesVolume: currentTradesVolume,
        equity: equity,
        freeMargin: freeMargin,
        isAnyOpenTrades: isAnyOpenTrades,
        isSwapFree: isSwapFree,
        leverage: leverage,
        name: name,
        phone: phone,
        totalTradesCount: totalTradesCount,
        totalTradesVolume: totalTradesVolume,
        type: type,
        verificationLevel: verificationLevel,
        zipCode: zipCode,
      );
}
