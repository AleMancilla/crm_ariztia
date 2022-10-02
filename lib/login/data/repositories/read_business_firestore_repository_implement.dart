import 'package:ariztia_crm/login/data/datasource/get_business_firestore_datasource.dart';
import 'package:ariztia_crm/login/data/models/business_model.dart';
import 'package:ariztia_crm/login/domain/repositories/read_business_firestore_repository.dart';

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
