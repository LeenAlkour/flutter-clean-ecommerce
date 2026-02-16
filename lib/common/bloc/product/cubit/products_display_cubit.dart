import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/usecase/usecase.dart';
import 'package:e_commerce/domain/product/entity/product_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'products_display_state.dart';
part 'products_display_cubit.freezed.dart';

class ProductsDisplayCubit extends Cubit<ProductsDisplayState> {
  final UseCase useCase;

  ProductsDisplayCubit({required this.useCase})
    : super(ProductsDisplayState.initial());
  void displayProducts({dynamic param}) async {
    emit(ProductsDisplayState.loading());
    var result = await useCase.call(params: param);
    result.fold(
      (error) {
        emit(ProductsDisplayState.error(error));
      },
      (data) {
        emit(ProductsDisplayState.loaded(data));
      },
    );
  }

  void displayInitial() {
    emit(ProductsDisplayState.initial());
  }
}
