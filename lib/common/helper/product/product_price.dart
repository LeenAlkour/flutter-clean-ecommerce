import 'package:e_commerce/domain/product/entity/product_entity.dart';

class ProductPriceHelper {
 static double providCurrentPrice(ProductEntity product) {
    return product.discountedPrice != 0
        ? product.discountedPrice.toDouble()
        : product.price.toDouble();
  }
  
}
