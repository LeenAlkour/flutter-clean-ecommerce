part of 'new_in_display_cubit.dart';


@freezed
class NewInDisplayState with _$NewInDisplayState {
  const factory NewInDisplayState.initial() = _Initial;
  const factory NewInDisplayState.loading() = Loading;
  const factory NewInDisplayState.loaded(List<dynamic> product) = Loaded;
  const factory NewInDisplayState.error({required String msg}) = Error;
}
