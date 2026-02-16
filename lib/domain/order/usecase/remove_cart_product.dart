import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/usecase/usecase.dart';
import 'package:e_commerce/domain/order/repository/order.dart';
import 'package:e_commerce/service_locator.dart';

class RemoveCartProductUSeCase implements UseCase<Either, String> {
  RemoveCartProductUSeCase();

  @override
  Future<Either> call({dynamic params}) async {
    return await sl<OrderRepository>().removeCartProduct(params!);
  }
}
