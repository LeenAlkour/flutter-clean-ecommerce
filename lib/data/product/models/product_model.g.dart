// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
  json['categoryId'] as String,
  (json['images'] as List<dynamic>).map((e) => e as String).toList(),
  (json['colors'] as List<dynamic>)
      .map((e) => ProductColorModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  const TimestampConverter().fromJson(json['createdDate'] as Timestamp),
  json['discountedPrice'] as num,
  (json['gender'] as num).toInt(),
  (json['sizes'] as List<dynamic>).map((e) => e as String).toList(),
  json['productId'] as String,
  json['price'] as num,
  (json['salesNumber'] as num).toInt(),
  json['title'] as String,
);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'images': instance.images,
      'colors': instance.colors.map((e) => e.toJson()).toList(),
      'createdDate': const TimestampConverter().toJson(instance.createdDate),
      'discountedPrice': instance.discountedPrice,
      'gender': instance.gender,
      'sizes': instance.sizes,
      'title': instance.title,
      'productId': instance.productId,
      'price': instance.price,
      'salesNumber': instance.salesNumber,
    };
