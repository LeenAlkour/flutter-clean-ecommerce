// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductColorModel _$ProductColorModelFromJson(Map<String, dynamic> json) =>
    ProductColorModel(
      rgb: (json['rgb'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      title: json['title'] as String,
    );

Map<String, dynamic> _$ProductColorModelToJson(ProductColorModel instance) =>
    <String, dynamic>{'title': instance.title, 'rgb': instance.rgb};
