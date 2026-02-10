import '../entities/promotion.dart';
import '../repositories/promotion_repository.dart';

class GetPromotionsUseCase {
  final PromotionRepository repository;

  GetPromotionsUseCase(this.repository);

  Future<List<Promotion>> call() async {
    return await repository.getPromotions();
  }
}
