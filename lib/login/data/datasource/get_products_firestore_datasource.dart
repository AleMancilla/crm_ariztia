import 'package:ariztia_crm/core/constants/api_firebase_constant.dart';
import 'package:ariztia_crm/login/data/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetProductsFirestoreDatasource {
  Future<List<ProductModel>> readProducts(String idBusiness) async {
    List<ProductModel> listProducts = [];
    await products
        .where('idBusiness', isEqualTo: idBusiness)
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        try {
          Map _json = (doc.data() as Map);

          List arrayDays = _json['days']; // array is now List<dynamic>
          List<String> listDays = List<String>.from(arrayDays);

          List arrayOptions = _json['options']; // array is now List<dynamic>
          List<Options> listOptions = arrayOptions.map<Options>((e) {
            List arrayOptionsItems = e['options']; // array is now List<dynamic>
            List<ItemOptions> listItemOptions = arrayOptionsItems
                .map<ItemOptions>((item) => ItemOptions(
                      name: item['name'],
                      isSelect: item['isSelect'] ?? false,
                      price: double.parse(item['price'].toString()),
                    ))
                .toList();

            return Options(
              title: e['title'],
              optionsItems: listItemOptions,
              quantity: e['quantity'],
            );
          }).toList();

          ProductModel productModel = ProductModel(
              city: _json['city'],
              days: listDays,
              description: _json['description'],
              idBusiness: _json['idBusiness'],
              idProduct: _json['idProduct'],
              name: _json['name'],
              nameBusiness: _json['nameBusiness'],
              photo: _json['photo'],
              price: double.parse(_json['price']),
              stock: _json['stock'],
              emergency: _json['emergency'],
              isOpen: _json['isOpen'],
              rangePriority: _json['rangePriority'],
              options: listOptions);

          listProducts.add(productModel);
          // log(_json.toString());
        } catch (e) {
          throw 'Error de lectura: $e';
        }
      }
    });

    return listProducts;
  }
}
