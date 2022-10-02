import 'package:ariztia_crm/core/constants/api_firebase_constant.dart';
import 'package:ariztia_crm/login/data/models/user_login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetUserForLoginFirestoreDatasource {
  Future<UserLogin?> readUserForLogin(String user, String pass) async {
    UserLogin? userLogin;
    await usersAdminsLogin
        .where('user', isEqualTo: user)
        .where('pass', isEqualTo: pass)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        try {
          Map _json = (doc.data() as Map);
          userLogin = UserLogin(_json['user'], _json['pass']);
        } catch (e) {
          throw 'Error de lectura: $e';
        }
      }
    });
    return userLogin;
  }
}
