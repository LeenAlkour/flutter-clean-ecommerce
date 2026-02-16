// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_ordered.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductOrderedEntity {

 String get productId; String get productTitle; String get productColor; String get productSize; int get productQuantity; double get productPrice; double get totalPrice; String get productImage; String get createdDate; String get id;
/// Create a copy of ProductOrderedEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductOrderedEntityCopyWith<ProductOrderedEntity> get copyWith => _$ProductOrderedEntityCopyWithImpl<ProductOrderedEntity>(this as ProductOrderedEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductOrderedEntity&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productTitle, productTitle) || other.productTitle == productTitle)&&(identical(other.productColor, productColor) || other.productColor == productColor)&&(identical(other.productSize, productSize) || other.productSize == productSize)&&(identical(other.productQuantity, productQuantity) || other.productQuantity == productQuantity)&&(identical(other.productPrice, productPrice) || other.productPrice == productPrice)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice)&&(identical(other.productImage, productImage) || other.productImage == productImage)&&(identical(other.createdDate, createdDate) || other.createdDate == createdDate)&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,productTitle,productColor,productSize,productQuantity,productPrice,totalPrice,productImage,createdDate,id);

@override
String toString() {
  return 'ProductOrderedEntity(productId: $productId, productTitle: $productTitle, productColor: $productColor, productSize: $productSize, productQuantity: $productQuantity, productPrice: $productPrice, totalPrice: $totalPrice, productImage: $productImage, createdDate: $createdDate, id: $id)';
}


}

/// @nodoc
abstract mixin class $ProductOrderedEntityCopyWith<$Res>  {
  factory $ProductOrderedEntityCopyWith(ProductOrderedEntity value, $Res Function(ProductOrderedEntity) _then) = _$ProductOrderedEntityCopyWithImpl;
@useResult
$Res call({
 String createdDate, String productId, String productTitle, String productColor, String productSize, int productQuantity, double productPrice, double totalPrice, String productImage, String id
});




}
/// @nodoc
class _$ProductOrderedEntityCopyWithImpl<$Res>
    implements $ProductOrderedEntityCopyWith<$Res> {
  _$ProductOrderedEntityCopyWithImpl(this._self, this._then);

  final ProductOrderedEntity _self;
  final $Res Function(ProductOrderedEntity) _then;

/// Create a copy of ProductOrderedEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? createdDate = null,Object? productId = null,Object? productTitle = null,Object? productColor = null,Object? productSize = null,Object? productQuantity = null,Object? productPrice = null,Object? totalPrice = null,Object? productImage = null,Object? id = null,}) {
  return _then(ProductOrderedEntity(
createdDate: null == createdDate ? _self.createdDate : createdDate // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,productTitle: null == productTitle ? _self.productTitle : productTitle // ignore: cast_nullable_to_non_nullable
as String,productColor: null == productColor ? _self.productColor : productColor // ignore: cast_nullable_to_non_nullable
as String,productSize: null == productSize ? _self.productSize : productSize // ignore: cast_nullable_to_non_nullable
as String,productQuantity: null == productQuantity ? _self.productQuantity : productQuantity // ignore: cast_nullable_to_non_nullable
as int,productPrice: null == productPrice ? _self.productPrice : productPrice // ignore: cast_nullable_to_non_nullable
as double,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,productImage: null == productImage ? _self.productImage : productImage // ignore: cast_nullable_to_non_nullable
as String,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductOrderedEntity].
extension ProductOrderedEntityPatterns on ProductOrderedEntity {
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
