// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductModel {

 String get categoryId; List<String> get images; List<ProductColorModel> get colors; DateTime get createdDate; num get discountedPrice; int get gender; List<String> get sizes; String get title; String get productId; num get price; int get salesNumber;
/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductModelCopyWith<ProductModel> get copyWith => _$ProductModelCopyWithImpl<ProductModel>(this as ProductModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductModel&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&const DeepCollectionEquality().equals(other.images, images)&&const DeepCollectionEquality().equals(other.colors, colors)&&(identical(other.createdDate, createdDate) || other.createdDate == createdDate)&&(identical(other.discountedPrice, discountedPrice) || other.discountedPrice == discountedPrice)&&(identical(other.gender, gender) || other.gender == gender)&&const DeepCollectionEquality().equals(other.sizes, sizes)&&(identical(other.title, title) || other.title == title)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.price, price) || other.price == price)&&(identical(other.salesNumber, salesNumber) || other.salesNumber == salesNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryId,const DeepCollectionEquality().hash(images),const DeepCollectionEquality().hash(colors),createdDate,discountedPrice,gender,const DeepCollectionEquality().hash(sizes),title,productId,price,salesNumber);

@override
String toString() {
  return 'ProductModel(categoryId: $categoryId, images: $images, colors: $colors, createdDate: $createdDate, discountedPrice: $discountedPrice, gender: $gender, sizes: $sizes, title: $title, productId: $productId, price: $price, salesNumber: $salesNumber)';
}


}

/// @nodoc
abstract mixin class $ProductModelCopyWith<$Res>  {
  factory $ProductModelCopyWith(ProductModel value, $Res Function(ProductModel) _then) = _$ProductModelCopyWithImpl;
@useResult
$Res call({
 String categoryId, List<String> images, List<ProductColorModel> colors, DateTime createdDate, num discountedPrice, int gender, List<String> sizes, String productId, num price, int salesNumber, String title
});




}
/// @nodoc
class _$ProductModelCopyWithImpl<$Res>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._self, this._then);

  final ProductModel _self;
  final $Res Function(ProductModel) _then;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryId = null,Object? images = null,Object? colors = null,Object? createdDate = null,Object? discountedPrice = null,Object? gender = null,Object? sizes = null,Object? productId = null,Object? price = null,Object? salesNumber = null,Object? title = null,}) {
  return _then(ProductModel(
null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,null == colors ? _self.colors : colors // ignore: cast_nullable_to_non_nullable
as List<ProductColorModel>,null == createdDate ? _self.createdDate : createdDate // ignore: cast_nullable_to_non_nullable
as DateTime,null == discountedPrice ? _self.discountedPrice : discountedPrice // ignore: cast_nullable_to_non_nullable
as num,null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int,null == sizes ? _self.sizes : sizes // ignore: cast_nullable_to_non_nullable
as List<String>,null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as num,null == salesNumber ? _self.salesNumber : salesNumber // ignore: cast_nullable_to_non_nullable
as int,null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductModel].
extension ProductModelPatterns on ProductModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

// dart format on
