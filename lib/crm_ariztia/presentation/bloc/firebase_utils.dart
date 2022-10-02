import 'package:ariztia_crm/crm_ariztia/data/models/business_model.dart';
import 'package:ariztia_crm/crm_ariztia/data/models/product_model.dart';
import 'package:ariztia_crm/crm_ariztia/data/repositories/read_business_firestore_repository_implement.dart';
import 'package:ariztia_crm/crm_ariztia/data/repositories/read_products_firestore_repository_implement.dart';

class FirebaseUtils {
  static final FirebaseUtils _instancia = FirebaseUtils._internal();
  factory FirebaseUtils() {
    return _instancia;
  }
  FirebaseUtils._internal();

  ReadBusinessFirestoreRepositoryImplements
      readBusinessFirestoreRepositoryImplements =
      ReadBusinessFirestoreRepositoryImplements();

  ReadProductsFirestoreRepositoryImplements
      readProductsFirestoreRepositoryImplements =
      ReadProductsFirestoreRepositoryImplements();

  Future<List<BusinessModel>> readAllRestaurant() async {
    return readBusinessFirestoreRepositoryImplements.readListBusiness();
  }

  Future<List<ProductModel>> readAllProductsByIdBusiness(
      String idBusiness) async {
    return readProductsFirestoreRepositoryImplements
        .readListProducts(idBusiness);
  }
}
