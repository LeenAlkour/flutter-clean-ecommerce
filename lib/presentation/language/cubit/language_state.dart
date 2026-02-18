import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_state.freezed.dart';

@freezed
abstract class LanguageState with _$LanguageState {
  const factory LanguageState.initial({
    @Default('en') String currentLanguageCode,
    @Default(false) bool isLoading,
  }) = _Initial;
}
