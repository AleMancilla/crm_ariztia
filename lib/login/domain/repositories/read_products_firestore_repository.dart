import 'package:ariztia_crm/login/data/models/product_model.dart';

abstract class ReadProductsFirestoreRepository {
  Future<List<ProductModel>> readListProducts(String idBusiness);
}
