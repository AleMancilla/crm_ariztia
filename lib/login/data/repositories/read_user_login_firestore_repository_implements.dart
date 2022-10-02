import 'package:ariztia_crm/crm_ariztia/data/datasource/get_business_firestore_datasource.dart';
import 'package:ariztia_crm/login/data/datasource/get_user_login_firestore_datasource.dart';
import 'package:ariztia_crm/crm_ariztia/data/models/business_model.dart';
import 'package:ariztia_crm/login/data/models/user_login.dart';
import 'package:ariztia_crm/login/domain/repositories/read_user_login_firestore_repository.dart';

class ReadUserLoginRepositoryImplements
    implements ReadUserLoginFirestoreRepository {
  final GetUserForLoginFirestoreDatasource getUserForLoginFirestoreDatasource =
      GetUserForLoginFirestoreDatasource();

  // final String idBusiness;
  // ReadBusinessFirestoreRepositoryImplements(this.idBusiness);

  @override
  Future<UserLogin?> readUserForLogin(String user, String pass) {
    try {
      return getUserForLoginFirestoreDatasource.readUserForLogin(user, pass);
    } catch (e) {
      throw '$e';
    }
  }
}
