import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/order/models/add_to_cart_req.dart';
import 'package:e_commerce/data/order/models/order.dart';
import 'package:e_commerce/data/order/models/order_registration_req.dart';
import 'package:e_commerce/data/order/models/product_ordered.dart';
import 'package:e_commerce/data/order/source/order_firebase_service.dart';
import 'package:e_commerce/domain/order/repository/order.dart';
import 'package:e_commerce/service_locator.dart';

class OrderRepositoryImpl implements OrderRepository {
  @override
  Future<Either> addToCart(AddToCartReqModel addToCardtReq) {
    return sl<OrderFirebaseService>().addToCart(addToCardtReq);
  }

  @override
  Future<Either> getCartProduct() async {
    final result = await sl<OrderFirebaseService>().getCartProduct();
    return result.fold(
      (error) => Left(error),
      (ruselt) => Right(
        List.from(
          ruselt,
        ).map((e) => ProductOrderedModel.fromJson(e).toEntity()).toList(),
      ),
    );
  }

  @override
  Future<Either> removeCartProduct(String id) async {
    final result = await sl<OrderFirebaseService>().removeCartProduct(id);
    return result.fold((error) => Left(error), (msg) => Right(msg));
  }

  @override
  Future<Either> orderRegistration(OrderRegistrationReqModel order) async {
    final result = await sl<OrderFirebaseService>().orderRegistration(order);
    return result.fold((error) => Left(error), (msg) => Right(msg));
  }
  
  @override
  Future<Either> getOrders() async {
    final result = await sl<OrderFirebaseService>().getOrders();
    return result.fold(
      (error) => Left(error),
      (ruselt) => Right(
        List.from(
          ruselt,
        ).map((e) => OrderModel.fromJson(e).toEntity()).toList(),
      ),
    );
  }
}
