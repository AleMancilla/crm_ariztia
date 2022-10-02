import 'package:ariztia_crm/crm_ariztia/data/datasource/get_business_firestore_datasource.dart';
import 'package:ariztia_crm/crm_ariztia/data/models/business_model.dart';
import 'package:ariztia_crm/crm_ariztia/domain/repositories/read_business_firestore_repository.dart';

class ReadBusinessFirestoreRepositoryImplements
    implements ReadBusinessFirestoreRepository {
  final GetBusinessFirestoreDatasource readBusinessFirestoreDatasource =
      GetBusinessFirestoreDatasource();

  // final String idBusiness;
  // ReadBusinessFirestoreRepositoryImplements(this.idBusiness);

  @override
  Future<List<BusinessModel>> readListBusiness() {
    try {
      return readBusinessFirestoreDatasource.readBusiness();
    } catch (e) {
      throw '$e';
    }
  }
}
