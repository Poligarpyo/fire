import '../entities/Account.dart';

abstract class AccountRepository {
  Future<Account> getAccount();
  Future<String> getLastNumber(); // add this
}
