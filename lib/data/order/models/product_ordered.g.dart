// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_ordered.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductOrderedModel _$ProductOrderedModelFromJson(Map<String, dynamic> json) =>
    ProductOrderedModel(
      createdDate: json['createdDate'] as String,
      productId: json['productId'] as String,
      productTitle: json['productTitle'] as String,
      productColor: json['productColor'] as String,
      productSize: json['productSize'] as String,
      productQuantity: (json['productQuantity'] as num).toInt(),
      productPrice: (json['productPrice'] as num).toDouble(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      productImage: json['productImage'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$ProductOrderedModelToJson(
  ProductOrderedModel instance,
) => <String, dynamic>{
  'productId': instance.productId,
  'productTitle': instance.productTitle,
  'productColor': instance.productColor,
  'productSize': instance.productSize,
  'productQuantity': instance.productQuantity,
  'productPrice': instance.productPrice,
  'totalPrice': instance.totalPrice,
  'productImage': instance.productImage,
  'createdDate': instance.createdDate,
  'id': instance.id,
};
