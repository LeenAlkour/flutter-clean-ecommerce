part of 'user_info_display_cubit.dart';

@freezed
class UserInfoDisplayState with _$UserInfoDisplayState {
  const factory UserInfoDisplayState.initial() = _Initial;
  const factory UserInfoDisplayState.loading() = Loading;
  const factory UserInfoDisplayState.loaded(T) = Loaded;
  const factory UserInfoDisplayState.error({required String msg}) = Error;


}
