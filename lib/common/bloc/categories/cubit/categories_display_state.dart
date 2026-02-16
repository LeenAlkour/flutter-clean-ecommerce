part of 'categories_display_cubit.dart';

@freezed
class CategoriesDisplayState with _$CategoriesDisplayState {
  const factory CategoriesDisplayState.initial() = _Initial;
  const factory CategoriesDisplayState.loading() = Loading;
  const factory CategoriesDisplayState.loaded(List<dynamic> category ) = Loaded;
  const factory CategoriesDisplayState.error(String error) = Error;
}
