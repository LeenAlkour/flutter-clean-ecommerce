import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/common/model/timestamp_converter.dart';
import 'package:e_commerce/data/order/models/order_status.dart';
import 'package:e_commerce/data/order/models/product_ordered.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part "order_registration_req.g.dart";
part "order_registration_req.freezed.dart";

@JsonSerializable(explicitToJson: true)
@freezed
class OrderRegistrationReqModel with _$OrderRegistrationReqModel {
  final List<ProductOrderedModel> products;
  final List<OrderStatusModel> orderStatus;
  @TimestampConverter()
  final DateTime createDate;
  final String code;
  final String shippingAddress;
  final int itemCount;
  final double totalPrice;

  OrderRegistrationReqModel({
    required this.orderStatus,
    required this.code,
    required this.shippingAddress,
    required this.products,
    required this.createDate,
    required this.itemCount,
    required this.totalPrice,
  });

  factory OrderRegistrationReqModel.fromJson(Map<String, dynamic> json) =>
      _$OrderRegistrationReqModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderRegistrationReqModelToJson(this);
}
