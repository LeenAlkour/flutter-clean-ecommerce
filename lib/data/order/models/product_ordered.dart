import 'package:e_commerce/domain/order/entities/product_ordered.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "product_ordered.g.dart";
part "product_ordered.freezed.dart";
@JsonSerializable(explicitToJson: true)
@freezed
class ProductOrderedModel with _$ProductOrderedModel {
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

  ProductOrderedModel({
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

  factory ProductOrderedModel.fromJson(Map<String, dynamic> json) =>
      _$ProductOrderedModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductOrderedModelToJson(this);

}

extension ProductOrderedXModel on ProductOrderedModel {
  ProductOrderedEntity toEntity() {
    return ProductOrderedEntity(
      id: id,
      createdDate: createdDate,
      productColor: productColor,
      productId: productId,
      productImage: productImage,
      productPrice: productPrice,
      productQuantity: productQuantity,
      productSize: productSize,
      productTitle: productTitle,
      totalPrice: totalPrice,
    );
  }
}

extension ProductOrderedXEntity on ProductOrderedEntity {
  ProductOrderedModel fromEntity() {
    return ProductOrderedModel(
      id: id,
      createdDate: createdDate,
      productColor: productColor,
      productId: productId,
      productImage: productImage,
      productPrice: productPrice,
      productQuantity: productQuantity,
      productSize: productSize,
      productTitle: productTitle,
      totalPrice: totalPrice,
    );
  }
}