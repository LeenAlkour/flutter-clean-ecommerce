import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/order/models/add_to_cart_req.dart';
import 'package:e_commerce/data/order/models/order_registration_req.dart';

abstract class OrderRepository {
  Future<Either> addToCart(AddToCartReqModel addToCardtReq);
  Future<Either> getCartProduct();
  Future<Either> removeCartProduct(String id);
  Future<Either> orderRegistration(OrderRegistrationReqModel order);
  Future<Either> getOrders();
}
