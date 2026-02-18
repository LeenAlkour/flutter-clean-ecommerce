import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/localization/language.dart';
import '../../../core/storage/get_storage.dart';
import 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageState.initial());
  final storage = StorageService();

  Future<void> initializeLanguage() async {
    try {
      emit(state.copyWith(isLoading: true));

      final savedLanguageCode = await storage.getLanguage();
      final languageCode = savedLanguageCode;

      emit(state.copyWith(currentLanguageCode: languageCode, isLoading: false));
    } catch (e) {
      print('Error initializing language: $e');
      emit(state.copyWith(isLoading: false));
    }
  }
  Future<void> changeLanguage(String languageCode) async {
    try {
      emit(state.copyWith(isLoading: true));

      // await SecureStorageService.saveLanguage(languageCode);flutter_secure_storage 

      emit(state.copyWith(currentLanguageCode: languageCode, isLoading: false));
    } catch (e) {
      print('Error changing language: $e');
      emit(state.copyWith(isLoading: false));
    }
  }

  String get currentLanguageCode => state.currentLanguageCode;

  Language get currentLanguage => Language.fromCode(currentLanguageCode);
}
