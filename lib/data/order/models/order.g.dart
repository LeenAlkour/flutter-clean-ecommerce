// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
  orderStatus: (json['orderStatus'] as List<dynamic>)
      .map((e) => OrderStatusModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  code: json['code'] as String,
  products: (json['products'] as List<dynamic>)
      .map((e) => ProductOrderedModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  createDate: const TimestampConverter().fromJson(
    json['createDate'] as Timestamp,
  ),
  shippingAddress: json['shippingAddress'] as String,
  itemCount: (json['itemCount'] as num).toInt(),
  totalPrice: (json['totalPrice'] as num).toDouble(),
);

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'products': instance.products.map((e) => e.toJson()).toList(),
      'createDate': const TimestampConverter().toJson(instance.createDate),
      'shippingAddress': instance.shippingAddress,
      'itemCount': instance.itemCount,
      'totalPrice': instance.totalPrice,
      'code': instance.code,
      'orderStatus': instance.orderStatus.map((e) => e.toJson()).toList(),
    };
