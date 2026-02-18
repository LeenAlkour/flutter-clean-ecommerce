import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/domain/category/usecase/get_categories.dart';
import 'package:e_commerce/core/di/service_locator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_display_state.dart';
part 'categories_display_cubit.freezed.dart';

class CategoriesDisplayCubit extends Cubit<CategoriesDisplayState> {
  CategoriesDisplayCubit() : super(CategoriesDisplayState.initial());
  void displayCategories() async {
    final result = await sl<GetCategoriesUseCase>().call();
    result.fold(
      (error) {
        emit(CategoriesDisplayState.error(error));
      },
      (data) {
        emit(CategoriesDisplayState.loaded(data));
      },
    );
  }
}
