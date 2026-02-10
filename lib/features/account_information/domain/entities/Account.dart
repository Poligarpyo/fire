class Account {
  final String address;
  final double balance;
  final String city;
  final String country;
  final int currency;
  final int currentTradesCount;
  final double currentTradesVolume;
  final double equity;
  final double freeMargin;
  final bool isAnyOpenTrades;
  final bool isSwapFree;
  final int leverage;
  final String name;
  final String phone;
  final int totalTradesCount;
  final double totalTradesVolume;
  final int type;
  final int verificationLevel;
  final String zipCode;

  const Account({
    required this.address,
    required this.balance,
    required this.city,
    required this.country,
    required this.currency,
    required this.currentTradesCount,
    required this.currentTradesVolume,
    required this.equity,
    required this.freeMargin,
    required this.isAnyOpenTrades,
    required this.isSwapFree,
    required this.leverage,
    required this.name,
    required this.phone,
    required this.totalTradesCount,
    required this.totalTradesVolume,
    required this.type,
    required this.verificationLevel,
    required this.zipCode,
  });
}
