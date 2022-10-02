import 'package:ariztia_crm/core/utils.dart';
import 'package:ariztia_crm/crm_ariztia/data/repositories/read_business_firestore_repository_implement.dart';
import 'package:ariztia_crm/crm_ariztia/presentation/bloc/business_bloc/business_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final ReadBusinessFirestoreRepositoryImplements
    readBusinessFirestoreRepositoryImplements =
    ReadBusinessFirestoreRepositoryImplements();

Future<void> chargeAllBusiness(BuildContext context,
    {BusinessBloc? businessBloc}) async {
  businessBloc ??= BlocProvider.of<BusinessBloc>(context, listen: false);
  await Future.delayed(Duration.zero, () async {
    // showProgressIndicator(context);
    await loadingAsyncFunction(context, () async {
      return await getAllBusiness(businessBloc!);
    });
  });
}

Future getAllBusiness(BusinessBloc _businessBloc) async {
  await readBusinessFirestoreRepositoryImplements
      .readListBusiness()
      .then((value) {
    _businessBloc.add(BusinessGetListEvent(value));
  }).onError((error, stackTrace) {
    return throw '$error';
  });
}
