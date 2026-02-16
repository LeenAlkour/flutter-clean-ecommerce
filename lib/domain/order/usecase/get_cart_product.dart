import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/usecase/usecase.dart';
import 'package:e_commerce/domain/order/repository/order.dart';
import 'package:e_commerce/service_locator.dart';

class GetCartProductUseCase implements UseCase<Either, dynamic> {
  GetCartProductUseCase();

  @override
  Future<Either> call({dynamic params}) async {
    return await sl<OrderRepository>().getCartProduct();
  }
}
