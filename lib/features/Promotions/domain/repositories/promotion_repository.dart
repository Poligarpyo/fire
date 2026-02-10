import '../entities/promotion.dart';

abstract class PromotionRepository {
  Future<List<Promotion>> getPromotions();
}
