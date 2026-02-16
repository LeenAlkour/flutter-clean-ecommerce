part of 'button_state_cubit.dart';

@freezed
class ButtonState with _$ButtonState {
  const factory ButtonState.initial() = Initial;
  const factory ButtonState.loading() = Loading;
  const factory ButtonState.success() = Success;
  const factory ButtonState.error(String msg) = Error;
}
