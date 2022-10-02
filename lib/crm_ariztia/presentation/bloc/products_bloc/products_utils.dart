import 'package:ariztia_crm/core/utils.dart';
import 'package:ariztia_crm/crm_ariztia/data/repositories/read_products_firestore_repository_implement.dart';
import 'package:ariztia_crm/crm_ariztia/presentation/bloc/products_bloc/products_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final ReadProductsFirestoreRepositoryImplements
    readProductsFirestoreRepositoryImplements =
    ReadProductsFirestoreRepositoryImplements();

Future<void> chargeAllProducts(BuildContext context,
    {ProductsBloc? productsBloc,
    String idBusinnes = 'OU0xmGobwJr7GrjJYAAr'}) async {
  productsBloc ??= BlocProvider.of<ProductsBloc>(context, listen: false);
  await Future.delayed(Duration.zero, () async {
    // showProgressIndicator(context);
    await loadingAsyncFunction(context, () async {
      return await getAllProducts(productsBloc!, idBusinnes);
    });
  });
}

Future getAllProducts(ProductsBloc _productsBloc, String idBusinnes) async {
  await readProductsFirestoreRepositoryImplements
      .readListProducts(idBusinnes)
      .then((value) {
    _productsBloc.add(ProductsFinalEvent(value));
  }).onError((error, stackTrace) {
    return throw '$error';
  });
}
