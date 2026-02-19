import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; 
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/storage/auth_local_datasource_provider.dart';
import '../../data/repositories/account_repository_impl.dart';
import '../../data/sources/account_remote_source.dart';
import '../../domain/entities/Account.dart';
import '../../domain/repositories/account_repository.dart';
import '../../domain/usecases/get_account_usecase.dart';
import '../notifiers/account_notifier.dart';
import '../notifiers/last_four_notifier.dart';
import '../states/paginated_account_state.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

final accountRemoteSourceProvider = Provider<AccountRemoteSource>((ref) {
  final dio = ref.read(dioProvider);
  final authLocal = ref.read(authLocalDataSourceProvider);
  return AccountRemoteSource(dio: dio, authLocalDataSource: authLocal);
});

final accountRepositoryProvider = Provider<AccountRepository>((ref) {
  return AccountRepositoryImpl(
    remoteDataSource: ref.read(accountRemoteSourceProvider),
  );
});

final getAccountUseCaseProvider = Provider<GetAccountUseCase>((ref) {
  final repository = ref.read(accountRepositoryProvider);
  return GetAccountUseCase(repository);
});



final accountProvider =
    StateNotifierProvider<AccountNotifier, AsyncValue<Account>>(
  (ref) {
    return AccountNotifier(ref.read(getAccountUseCaseProvider));
  },
);


final lastFourNotifierProvider =
    StateNotifierProvider<LastFourNotifier, AsyncValue<String>>((ref) {
  final useCase = ref.read(getAccountUseCaseProvider);
  return LastFourNotifier(useCase);
});
