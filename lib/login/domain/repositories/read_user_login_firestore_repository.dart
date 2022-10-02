import 'package:ariztia_crm/login/data/models/business_model.dart';
import 'package:ariztia_crm/login/data/models/user_login.dart';

abstract class ReadUserLoginFirestoreRepository {
  Future<UserLogin?> readUserForLogin(String user, String pass);
}
