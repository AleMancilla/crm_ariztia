import 'package:ariztia_crm/core/constants/api_firebase_constant.dart';
import 'package:ariztia_crm/crm_ariztia/data/models/business_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetBusinessFirestoreDatasource {
  Future<List<BusinessModel>> readBusiness() async {
    List<BusinessModel> listBusiness = [];
    await business
        .where('idBusiness',
            whereIn: ['OU0xmGobwJr7GrjJYAAr', 'kGtKYpYUjKqenr5DFfZi'])
        .get()
        .then((QuerySnapshot querySnapshot) {
          for (var doc in querySnapshot.docs) {
            try {
              Map _json = (doc.data() as Map);
              // print(_json);
              BusinessModel businessModel = BusinessModel(
                  _json['idBusiness'], _json['name'], _json['photo']);

              listBusiness.add(businessModel);
            } catch (e) {
              throw 'Error de lectura: $e';
            }
          }
        });

    return listBusiness;
  }
}
