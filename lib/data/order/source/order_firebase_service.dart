import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/order/models/add_to_cart_req.dart';
import 'package:e_commerce/data/order/models/order_registration_req.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class OrderFirebaseService {
  Future<Either> addToCart(AddToCartReqModel addToCardtReq);
  Future<Either> getCartProduct();
  Future<Either> removeCartProduct(String id);
  Future<Either> orderRegistration(OrderRegistrationReqModel order);
  Future<Either> getOrders();
}

class OrderFirebaseServiceImpl extends OrderFirebaseService {
  @override
  Future<Either> addToCart(AddToCartReqModel addToCardtReq) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .collection('Cart')
          .add(addToCardtReq.toJson());
      return right('Add to cart was successfully');
    } catch (e) {
      return left('Please try again');
    }
  }

  @override
  Future<Either> getCartProduct() async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      final result = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection('Cart')
          .get();
      List<Map> products = [];
      for (var item in result.docs) {
        var data = item.data();
        data.addAll({'id': item.id});
        products.add(data);
      }

      return Right(products);
    } catch (e) {
      print(e);

      return Left('Please try again');
    }
  }

  @override
  Future<Either> removeCartProduct(String id) async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection('Cart')
          .doc(id)
          .delete();

      return Right('Product removed successfully');
    } catch (e) {
      return Left('Please try again');
    }
  }

  @override
  Future<Either> orderRegistration(order) async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection('Orders')
          .add(order.toJson());
      for (var item in order.products) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .collection('Cart')
            .doc(item.id)
            .delete();
      }

      return Right('Order registered successfully');
    } catch (e) {
      return Left('Please try again');
    }
  }

  @override
  Future<Either> getOrders() async {
    try {
      var user = FirebaseAuth.instance.currentUser;

      final result = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .collection("Orders")
          .get();

      return Right(result.docs.map((e) => e.data()).toList());
    } catch (e) {
      return Left('Please try again');
    }
  }
}
