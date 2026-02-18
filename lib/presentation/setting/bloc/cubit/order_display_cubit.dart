import 'package:bloc/bloc.dart';
import 'package:e_commerce/domain/order/entities/order.dart';
import 'package:e_commerce/domain/order/usecase/get_orders.dart';
import 'package:e_commerce/core/di/service_locator.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_display_state.dart';
part 'order_display_cubit.freezed.dart';

class OrderDisplayCubit extends Cubit<OrderDisplayState> {
  OrderDisplayCubit() : super(OrderDisplayState.loading());
  void displayOrders() async {
    final result = await sl<GetOrdersUseCase>().call();
    result.fold(
      (error) {
        emit(OrderDisplayState.error(msg: error));
      },
      (orders) {
        emit(OrderDisplayState.loaded(orders));
      },
    );
  }
}
