import 'package:e_commerce/domain/product/entity/color_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "color.g.dart";
part "color.freezed.dart";
@JsonSerializable(explicitToJson: true)
@freezed
class ProductColorModel with _$ProductColorModel {
  String title;
  List<int> rgb;

  ProductColorModel({required this.rgb, required this.title});
  factory ProductColorModel.fromJson(Map<String, dynamic> json) =>
      _$ProductColorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductColorModelToJson(this);
}
extension ProductColorModelX on ProductColorModel {
  ProductColorEntity toEntity() {
    return ProductColorEntity(rgb: rgb, title: title);
  }
}
extension ProductColorEntityX on ProductColorEntity {
  ProductColorModel fromEntity() {
    return ProductColorModel(rgb: rgb, title: title);
  }
}
