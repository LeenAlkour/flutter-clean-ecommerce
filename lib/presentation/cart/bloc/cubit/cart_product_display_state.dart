part of 'cart_product_display_cubit.dart';

@freezed
class CartProductDisplayState with _$CartProductDisplayState {
  const factory CartProductDisplayState.initial() = _Initial;
  const factory CartProductDisplayState.loading() = Loading;
  const factory CartProductDisplayState.loaded(List<ProductOrderedEntity> product) = Loaded;
  const factory CartProductDisplayState.error(String msg) = Error;
}
