import 'package:freezed_annotation/freezed_annotation.dart';

part "category_entity.freezed.dart";

@freezed
class CategoryEntity with _$CategoryEntity {
  
  String image;
  String title;
  String categoryId;
  CategoryEntity({
  
    required this.image,
    required this.categoryId,
    required this.title,
  });
}
