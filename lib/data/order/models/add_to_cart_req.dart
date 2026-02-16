

import 'package:freezed_annotation/freezed_annotation.dart';

part "add_to_cart_req.g.dart";
part "add_to_cart_req.freezed.dart";

@JsonSerializable()
@freezed

class AddToCartReqModel with _$AddToCartReqModel {
  final String productId;
  final String productTitle;
  final String productColor;
  final String productSize;
  final int productQuantity;
  final double productPrice;
  final double totalPrice;
  final String productImage;
  final String createdDate;

  AddToCartReqModel(
     {
     required this.createdDate,
    required this.productId,
    required this.productTitle,
    required this.productColor,
    required this.productSize,
    required this.productQuantity,
    required this.productPrice,
    required this.totalPrice,
    required this.productImage,
  });

  factory AddToCartReqModel.fromJson(Map<String, dynamic> json) =>
      _$AddToCartReqModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddToCartReqModelToJson(this);
}
