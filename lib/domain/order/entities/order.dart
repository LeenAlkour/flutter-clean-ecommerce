import 'package:e_commerce/domain/order/entities/order_status.dart';
import 'package:e_commerce/domain/order/entities/product_ordered.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part "order.freezed.dart";

@freezed
class OrderEntity with _$OrderEntity {
  final List<ProductOrderedEntity> products;
  final DateTime createDate;
  final String shippingAddress;
  final int itemCount;
  final double totalPrice;
  final String code;
  final List<OrderStatusEntity> orderStatus;

  OrderEntity({
    required this.code,
    required this.products,
    required this.createDate,
    required this.shippingAddress,
    required this.itemCount,
    required this.totalPrice,
    required this.orderStatus,
  });
}
