import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/common/model/timestamp_converter.dart';
import 'package:e_commerce/data/product/models/color.dart';
import 'package:e_commerce/domain/product/entity/product_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "product_model.g.dart";
part "product_model.freezed.dart";
@JsonSerializable(explicitToJson: true)
@freezed

class ProductModel with _$ProductModel {
    final String categoryId;
  final List<String> images;
  final List<ProductColorModel> colors;
  
  @TimestampConverter()
  final DateTime createdDate;
  final num discountedPrice;
  final int gender;
  final List<String> sizes;
  final String title;
  final String productId;
  final num price;
  final int salesNumber;

  ProductModel(
    this.categoryId,
    this.images,
    this.colors,
    this.createdDate,
    this.discountedPrice,
    this.gender,
    this.sizes,
    this.productId,
    this.price,
    this.salesNumber, this.title,
   );
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
extension ProductModelX on ProductModel {
  ProductEntity toEntity() {
    return ProductEntity(
      categoryId,
      images,
      colors.map((e) => e.toEntity()).toList(),
      createdDate,
      discountedPrice,
      gender,
      sizes,
      productId,
      price,
      salesNumber,
      title,
    );
  }
}
extension ProductEntityX on ProductEntity {
  ProductModel fromEntity() {
    return ProductModel(
      categoryId,
      images,
      colors.map((e) => e.fromEntity()).toList(),
      createdDate,
      discountedPrice,
      gender,
      sizes,
      productId,
      price,
      salesNumber,
      title,
    );
  }
}
