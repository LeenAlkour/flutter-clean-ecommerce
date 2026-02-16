import 'package:freezed_annotation/freezed_annotation.dart';

part "order_status.freezed.dart";

@freezed
class OrderStatusEntity with _$OrderStatusEntity {
  final String title;
  final bool done;
  final DateTime createDate;

  OrderStatusEntity({
    required this.title,
    required this.done,
    required this.createDate,
  });
}
