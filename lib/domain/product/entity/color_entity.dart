import 'package:freezed_annotation/freezed_annotation.dart';

part "color_entity.freezed.dart";
@freezed
class ProductColorEntity with _$ProductColorEntity {
  String title; 
  List<int> rgb;

  ProductColorEntity({required this.rgb, required this.title});
}

