import 'package:bloc/bloc.dart';
import 'package:e_commerce/domain/order/entities/product_ordered.dart';
import 'package:e_commerce/domain/order/usecase/get_cart_product.dart';
import 'package:e_commerce/domain/order/usecase/remove_cart_product.dart';
import 'package:e_commerce/service_locator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_product_display_state.dart';
part 'cart_product_display_cubit.freezed.dart';

class CartProductDisplayCubit extends Cubit<CartProductDisplayState> {
  CartProductDisplayCubit() : super(CartProductDisplayState.loading());
  void displayCartProduct() async {

    final result = await sl<GetCartProductUseCase>().call();
    result.fold(
      (error) => emit(CartProductDisplayState.error(error)),
      (data) => emit(CartProductDisplayState.loaded(data)),
    );
  }

  void removeCartProduct(ProductOrderedEntity product) async {
    emit(CartProductDisplayState.loading());

    final result = await sl<RemoveCartProductUSeCase>().call(
      params: product.id,
    );
    result.fold(
      (error) => emit(CartProductDisplayState.error(error)),
      (data) => displayCartProduct(),
    );
  }
}
