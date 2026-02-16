import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/usecase/usecase.dart';
import 'package:e_commerce/data/order/models/add_to_cart_req.dart';
import 'package:e_commerce/domain/order/repository/order.dart';
import 'package:e_commerce/service_locator.dart';

class AddToCartUseCase implements UseCase<Either, AddToCartReqModel> {
  AddToCartUseCase();

  @override
  Future<Either> call({AddToCartReqModel? params}) async {
    return await sl<OrderRepository>().addToCart(params!);
  }
}
