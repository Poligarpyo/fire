import '../../domain/entities/promotion.dart';
import '../../domain/repositories/promotion_repository.dart'; 
import '../model/promotion_model.dart';
import '../sources/promotion_remote_source.dart';

class PromotionRepositoryImpl implements PromotionRepository {
  final PromotionRemoteSource remoteSource;

  PromotionRepositoryImpl({required this.remoteSource});

  @override
  Future<List<Promotion>> getPromotions() async {
    final models = await remoteSource.fetchPromotions();
    return models.map((e) => e.toEntity()).toList();
  }
}
