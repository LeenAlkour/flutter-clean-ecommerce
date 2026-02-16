import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/usecase/usecase.dart';
import 'package:e_commerce/data/order/models/order_registration_req.dart';
import 'package:e_commerce/domain/order/repository/order.dart';
import 'package:e_commerce/service_locator.dart';

class OrderRegistrationUseCase implements UseCase<Either, OrderRegistrationReqModel> {
  OrderRegistrationUseCase();

  @override
  Future<Either> call({OrderRegistrationReqModel? params}) async {
    return await sl<OrderRepository>().orderRegistration(params!);
  }
}
