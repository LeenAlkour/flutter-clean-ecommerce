import 'package:e_commerce/domain/category/entity/category_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "category.g.dart";
part "category.freezed.dart";

@JsonSerializable()
@freezed
class CategoryModel with _$CategoryModel {
  String title;
  String image;
  String categoryId;

  CategoryModel({required this.categoryId, required this.image,
    required this.title,
  });
  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
extension CategoryModelX on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(
      categoryId: categoryId,
      image: image,
      title: title
    );
  }
}
