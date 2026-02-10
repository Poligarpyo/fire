import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/promotion.dart';  

part 'promotion_model.freezed.dart';
part 'promotion_model.g.dart';

@freezed
abstract class PromotionModel with _$PromotionModel {
  const factory PromotionModel({
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'image') required String image,
    @JsonKey(name: 'link') required String link,
  }) = _PromotionModel;

  factory PromotionModel.fromJson(Map<String, dynamic> json) =>
      _$PromotionModelFromJson(json);
}

extension PromotionModelX on PromotionModel {
  // Convert PromotionModel to Promotion Entity
  Promotion toEntity() => Promotion(
        title: title,
        description: description,
        image: image,
        link: link,
      );
}
