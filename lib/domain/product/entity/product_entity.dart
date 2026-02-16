import 'package:e_commerce/domain/product/entity/color_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "product_entity.freezed.dart";

@freezed
class ProductEntity with _$ProductEntity {
  final String categoryId;
  final List<String> images;
  final List<ProductColorEntity> colors;
  final DateTime createdDate;
  final num discountedPrice;
  final int gender;
  final List<String> sizes;
  final String title;
  final String productId;
  final num price;
  final int salesNumber;

  ProductEntity(
    this.categoryId,
    this.images,
    this.colors,
    this.createdDate,
    this.discountedPrice,
    this.gender,
    this.sizes,
    this.productId,
    this.price,
    this.salesNumber,
    this.title,
  );
}
