import 'package:freezed_annotation/freezed_annotation.dart';

part "product_ordered.g.dart";
part "product_ordered.freezed.dart";
@JsonSerializable()
@freezed
class ProductOrderedEntity with _$ProductOrderedEntity {
  final String productId;
  final String productTitle;
  final String productColor;
  final String productSize;
  final int productQuantity;
  final double productPrice;
  final double totalPrice;
  final String productImage;
  final String createdDate;
  final String id;

  ProductOrderedEntity({
    required this.createdDate,
    required this.productId,
    required this.productTitle,
    required this.productColor,
    required this.productSize,
    required this.productQuantity,
    required this.productPrice,
    required this.totalPrice,
    required this.productImage,
    required this.id,
  });
  factory ProductOrderedEntity.fromJson(Map<String, dynamic> json) =>
      _$ProductOrderedEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProductOrderedEntityToJson(this);
}
