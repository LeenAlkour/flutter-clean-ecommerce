part of 'products_display_cubit.dart';

@freezed
class ProductsDisplayState with _$ProductsDisplayState {
  const factory ProductsDisplayState.initial() = _Initial;
  const factory ProductsDisplayState.loading() = Loading;
  const factory ProductsDisplayState.loaded(List<ProductEntity> data) = Loaded;
  const factory ProductsDisplayState.error(String msg) = Error;
}
