import 'package:ariztia_crm/crm_ariztia/data/models/business_model.dart';

abstract class ReadBusinessFirestoreRepository {
  Future<List<BusinessModel>> readListBusiness();
}
