// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_registration_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderRegistrationReqModel _$OrderRegistrationReqModelFromJson(
  Map<String, dynamic> json,
) => OrderRegistrationReqModel(
  orderStatus: (json['orderStatus'] as List<dynamic>)
      .map((e) => OrderStatusModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  code: json['code'] as String,
  shippingAddress: json['shippingAddress'] as String,
  products: (json['products'] as List<dynamic>)
      .map((e) => ProductOrderedModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  createDate: const TimestampConverter().fromJson(
    json['createDate'] as Timestamp,
  ),
  itemCount: (json['itemCount'] as num).toInt(),
  totalPrice: (json['totalPrice'] as num).toDouble(),
);

Map<String, dynamic> _$OrderRegistrationReqModelToJson(
  OrderRegistrationReqModel instance,
) => <String, dynamic>{
  'products': instance.products.map((e) => e.toJson()).toList(),
  'orderStatus': instance.orderStatus.map((e) => e.toJson()).toList(),
  'createDate': const TimestampConverter().toJson(instance.createDate),
  'code': instance.code,
  'shippingAddress': instance.shippingAddress,
  'itemCount': instance.itemCount,
  'totalPrice': instance.totalPrice,
};
