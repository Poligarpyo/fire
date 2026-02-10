import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/promotion.dart'; 
import '../../data/repositories/promotion_repository_impl.dart';
import '../../data/sources/promotion_remote_source.dart';
import '../../domain/usecases/get_promotion_usecase.dart';

// Repository provider
final promotionRepositoryProvider = Provider((ref) {
  return PromotionRepositoryImpl(remoteSource: PromotionRemoteSource());
});

// UseCase provider
final getPromotionsUseCaseProvider = Provider((ref) {
  final repo = ref.read(promotionRepositoryProvider);
  return GetPromotionsUseCase(repo);
});

// Promotions state provider
final promotionsProvider = FutureProvider<List<Promotion>>((ref) async {
  final useCase = ref.read(getPromotionsUseCaseProvider);
  return await useCase();
});
