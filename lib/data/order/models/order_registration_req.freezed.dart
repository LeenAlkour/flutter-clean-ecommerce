// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_registration_req.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderRegistrationReqModel {

 List<ProductOrderedModel> get products; List<OrderStatusModel> get orderStatus; DateTime get createDate; String get code; String get shippingAddress; int get itemCount; double get totalPrice;
/// Create a copy of OrderRegistrationReqModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderRegistrationReqModelCopyWith<OrderRegistrationReqModel> get copyWith => _$OrderRegistrationReqModelCopyWithImpl<OrderRegistrationReqModel>(this as OrderRegistrationReqModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderRegistrationReqModel&&const DeepCollectionEquality().equals(other.products, products)&&const DeepCollectionEquality().equals(other.orderStatus, orderStatus)&&(identical(other.createDate, createDate) || other.createDate == createDate)&&(identical(other.code, code) || other.code == code)&&(identical(other.shippingAddress, shippingAddress) || other.shippingAddress == shippingAddress)&&(identical(other.itemCount, itemCount) || other.itemCount == itemCount)&&(identical(other.totalPrice, totalPrice) || other.totalPrice == totalPrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(products),const DeepCollectionEquality().hash(orderStatus),createDate,code,shippingAddress,itemCount,totalPrice);

@override
String toString() {
  return 'OrderRegistrationReqModel(products: $products, orderStatus: $orderStatus, createDate: $createDate, code: $code, shippingAddress: $shippingAddress, itemCount: $itemCount, totalPrice: $totalPrice)';
}


}

/// @nodoc
abstract mixin class $OrderRegistrationReqModelCopyWith<$Res>  {
  factory $OrderRegistrationReqModelCopyWith(OrderRegistrationReqModel value, $Res Function(OrderRegistrationReqModel) _then) = _$OrderRegistrationReqModelCopyWithImpl;
@useResult
$Res call({
 List<OrderStatusModel> orderStatus, String code, String shippingAddress, List<ProductOrderedModel> products, DateTime createDate, int itemCount, double totalPrice
});




}
/// @nodoc
class _$OrderRegistrationReqModelCopyWithImpl<$Res>
    implements $OrderRegistrationReqModelCopyWith<$Res> {
  _$OrderRegistrationReqModelCopyWithImpl(this._self, this._then);

  final OrderRegistrationReqModel _self;
  final $Res Function(OrderRegistrationReqModel) _then;

/// Create a copy of OrderRegistrationReqModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderStatus = null,Object? code = null,Object? shippingAddress = null,Object? products = null,Object? createDate = null,Object? itemCount = null,Object? totalPrice = null,}) {
  return _then(OrderRegistrationReqModel(
orderStatus: null == orderStatus ? _self.orderStatus : orderStatus // ignore: cast_nullable_to_non_nullable
as List<OrderStatusModel>,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,shippingAddress: null == shippingAddress ? _self.shippingAddress : shippingAddress // ignore: cast_nullable_to_non_nullable
as String,products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<ProductOrderedModel>,createDate: null == createDate ? _self.createDate : createDate // ignore: cast_nullable_to_non_nullable
as DateTime,itemCount: null == itemCount ? _self.itemCount : itemCount // ignore: cast_nullable_to_non_nullable
as int,totalPrice: null == totalPrice ? _self.totalPrice : totalPrice // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderRegistrationReqModel].
extension OrderRegistrationReqModelPatterns on OrderRegistrationReqModel {
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
