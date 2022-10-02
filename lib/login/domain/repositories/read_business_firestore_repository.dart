import 'package:ariztia_crm/login/data/models/business_model.dart';

abstract class ReadBusinessFirestoreRepository {
  Future<List<BusinessModel>> readListBusiness();
}
