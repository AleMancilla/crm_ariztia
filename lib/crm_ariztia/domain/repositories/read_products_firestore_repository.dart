import 'package:ariztia_crm/crm_ariztia/data/models/product_model.dart';

abstract class ReadProductsFirestoreRepository {
  Future<List<ProductModel>> readListProducts(String idBusiness);
}
