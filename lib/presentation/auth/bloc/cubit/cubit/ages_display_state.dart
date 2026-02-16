part of 'ages_display_cubit.dart';

@freezed
class AgesDisplayState with _$AgesDisplayState {
  const factory AgesDisplayState.initial() = _Initial;
  const factory AgesDisplayState.loading() = Loading;
  const factory AgesDisplayState.loaded(T) = Loaded;
  const factory AgesDisplayState.error({required String msg}) = Error;

}
