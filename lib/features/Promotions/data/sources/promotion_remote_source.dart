import 'dart:convert';
import 'package:flutter/services.dart';
import '../model/promotion_model.dart'; 

class PromotionRemoteSource {
  Future<List<PromotionModel>> fetchPromotions() async {
    // Load mock JSON (assets/mock_promotions.json)
    final String response =
        await rootBundle.loadString('assets/json/mock_promotions.json');

    final List<dynamic> data = json.decode(response) as List<dynamic>;
    return data.map((e) => PromotionModel.fromJson(e as Map<String, dynamic>)).toList();
  }
}
