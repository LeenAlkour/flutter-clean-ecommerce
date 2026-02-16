// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderStatusModel _$OrderStatusModelFromJson(Map<String, dynamic> json) =>
    OrderStatusModel(
      title: json['title'] as String,
      done: json['done'] as bool,
      createDate: const TimestampConverter().fromJson(
        json['createDate'] as Timestamp,
      ),
    );

Map<String, dynamic> _$OrderStatusModelToJson(OrderStatusModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'done': instance.done,
      'createDate': const TimestampConverter().toJson(instance.createDate),
    };
