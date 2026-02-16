// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderStatusModel _$OrderStatusModelFromJson(Map<String, dynamic> json) =>
    OrderStatusModel(
      title: json['title'] as String,
      done: json['done'] as bool,
      createDate: DateTime.parse(json['createDate'] as String),
    );

Map<String, dynamic> _$OrderStatusModelToJson(OrderStatusModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'done': instance.done,
      'createDate': instance.createDate.toIso8601String(),
    };
