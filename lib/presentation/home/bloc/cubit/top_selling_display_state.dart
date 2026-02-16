part of 'top_selling_display_cubit.dart';

@freezed
class TopSellingDisplayState with _$TopSellingDisplayState {
  const factory TopSellingDisplayState.initial() = _Initial;
  const factory TopSellingDisplayState.loading() = Loading;
  const factory TopSellingDisplayState.loaded(List<dynamic> product) = Loaded;
  const factory TopSellingDisplayState.error({required String msg}) = Error;
}
