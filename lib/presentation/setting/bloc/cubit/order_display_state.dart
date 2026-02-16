part of 'order_display_cubit.dart';

@freezed
class OrderDisplayState with _$OrderDisplayState {
    const factory OrderDisplayState.initial() = _Initial;
  const factory OrderDisplayState.loading() = Loading;
  const factory OrderDisplayState.loaded(List<OrderEntity> orders) = Loaded;
  const factory OrderDisplayState.error({required String msg}) = Error;
}

