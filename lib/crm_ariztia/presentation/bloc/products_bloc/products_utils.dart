import 'package:ariztia_crm/core/utils.dart';
import 'package:ariztia_crm/crm_ariztia/data/repositories/read_products_firestore_repository_implement.dart';
import 'package:ariztia_crm/crm_ariztia/presentation/bloc/products_bloc/products_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final ReadProductsFirestoreRepositoryImplements
    readProductsFirestoreRepositoryImplements =
    ReadProductsFirestoreRepositoryImplements();

Future<void> chargeAllProducts(BuildContext context,
    {String idBusinnes = 'OU0xmGobwJr7GrjJYAAr'}) async {
  ProductsBloc productsBloc =
      BlocProvider.of<ProductsBloc>(context, listen: false);
  await Future.delayed(Duration.zero, () async {
    // showProgressIndicator(context);
    print('____ ___ 1 ___ ');
    await loadingAsyncFunction(context, () async {
      print('____ ___ 2 ___ ');
      return await getAllProducts(productsBloc, idBusinnes);
    });
    print('____ ___ 6 ___ ');
  });
}

Future getAllProducts(ProductsBloc _productsBloc, String idBusinnes) async {
  print('____ ___ 3 ___ ');
  await readProductsFirestoreRepositoryImplements
      .readListProducts(idBusinnes)
      .then((value) {
    print('____ ___ 4 ___ ');
    print(_productsBloc);
    _productsBloc.add(ProductsFinalEvent(value));
    print(_productsBloc);
    print('____ ___ 4.1 ___ ');
  }).onError((error, stackTrace) {
    print('____ ___ erropr 1  ___ ');
    return throw '$error';
  });
  print('____ ___ 7 ___ ');
}
