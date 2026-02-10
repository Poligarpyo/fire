import '../../domain/entities/Account.dart';
import '../../domain/repositories/account_repository.dart';
import '../model/account_model.dart';
import '../sources/account_remote_source.dart';

class AccountRepositoryImpl implements AccountRepository {
  final AccountRemoteSource remoteDataSource;

  AccountRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Account> getAccount() async {
    final model = await remoteDataSource.fetchAccount();
    return model.toEntity();
  }

  @override
  Future<String> getLastNumber() async {
    final fullNumber = await remoteDataSource.fetchLastFourNumber();

    // ✅ Keep only last 4 digits
    final lastFour =
        fullNumber.replaceAll(RegExp(r'\D'), ''); // remove non-digits
    if (lastFour.length > 4) {
      return lastFour.substring(lastFour.length - 4);
    }
    return lastFour;
  }
}
