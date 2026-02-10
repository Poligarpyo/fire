import 'package:flutter_riverpod/flutter_riverpod.dart'; 
import '../../domain/usecases/get_account_usecase.dart';

class LastFourNotifier extends StateNotifier<AsyncValue<String>> {
  final GetAccountUseCase _useCase;

  LastFourNotifier(this._useCase) : super(const AsyncValue.loading()) {
    fetchLastFour();
  }

  Future<void> fetchLastFour() async {
    try {
      state = const AsyncValue.loading();
      final lastFour = await _useCase.getLastNumber();
      state = AsyncValue.data(lastFour);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
