import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/common/model/timestamp_converter.dart';
import 'package:e_commerce/domain/order/entities/order_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part "order_status.g.dart";
part "order_status.freezed.dart";

@JsonSerializable(explicitToJson: true)
@freezed
class OrderStatusModel with _$OrderStatusModel {
  final String title;
  final bool done;

  @TimestampConverter()
  final DateTime createDate;

  OrderStatusModel({
    required this.title,
    required this.done,
    required this.createDate,
  });
  factory OrderStatusModel.fromJson(Map<String, dynamic> json) =>
      _$OrderStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderStatusModelToJson(this);
}

extension OrderStatusXModel on OrderStatusModel {
  OrderStatusEntity toEntity() {
    return OrderStatusEntity(createDate: createDate, done: done, title: title);
  }
}
