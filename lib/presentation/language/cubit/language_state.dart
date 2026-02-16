import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_state.freezed.dart';

@freezed
class LanguageState with _$LanguageState {
  const factory LanguageState({
    required String currentLanguageCode,
    required bool isLoading,
  }) = _LanguageState;

  factory LanguageState.initial() =>
      const LanguageState(currentLanguageCode: 'en', isLoading: false);
      
        @override
        String get currentLanguageCode => throw UnimplementedError();
      
        @override
        bool get isLoading => throw UnimplementedError();
}
