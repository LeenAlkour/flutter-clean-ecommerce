import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/common/model/timestamp_converter.dart';
import 'package:e_commerce/data/order/models/order_status.dart';
import 'package:e_commerce/data/order/models/product_ordered.dart';
import 'package:e_commerce/domain/order/entities/order.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "order.g.dart";
part "order.freezed.dart";

@JsonSerializable(explicitToJson: true)
@freezed
class OrderModel with _$OrderModel {
  final List<ProductOrderedModel> products;
  @TimestampConverter()
  final DateTime createDate;
  final String shippingAddress;
  final int itemCount;
  final double totalPrice;
  final String code;
  final List<OrderStatusModel> orderStatus;

  OrderModel({
    required this.orderStatus,
    required this.code,
    required this.products,
    required this.createDate,
    required this.shippingAddress,
    required this.itemCount,
    required this.totalPrice,
  });
  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}

extension OrderXModel on OrderModel {
  OrderEntity toEntity() {
    return OrderEntity(
      itemCount: itemCount,
      createDate: createDate,
      products: products.map((e) => e.toEntity()).toList(),

      shippingAddress: shippingAddress,
      totalPrice: totalPrice,
      code: code,
      orderStatus: orderStatus.map((e) => e.toEntity()).toList(),
    );
  }
}
