import 'package:freezed_annotation/freezed_annotation.dart';

part "order_status.freezed.dart";
part "order_status.g.dart";
@JsonSerializable(explicitToJson: true)

@freezed
class OrderStatusModel with _$OrderStatusModel {
  final String title;
  final bool done;
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
