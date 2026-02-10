import '../entities/Account.dart';
import '../repositories/account_repository.dart';

class GetAccountUseCase {
  final AccountRepository repository;
 
  GetAccountUseCase(this.repository);

  Future<Account> call() {
    return repository.getAccount();
  }
 // Fetch last 4 number as plain string
  Future<String> getLastNumber() {
    return repository.getLastNumber();
  }
}
