import 'dart:html';

import 'package:ariztia_crm/core/function_utils.dart';
import 'package:ariztia_crm/crm_ariztia/presentation/bloc/business_bloc/business_bloc.dart';
import 'package:ariztia_crm/crm_ariztia/presentation/bloc/products_bloc/products_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedBusinessOptions extends StatelessWidget {
  const SelectedBusinessOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BusinessBloc businessBloc =
        BlocProvider.of<BusinessBloc>(context, listen: false);
    return Material(
      color: Colors.transparent,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            width: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            margin: EdgeInsets.all(100),
            child: BlocBuilder<BusinessBloc, BusinessState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Text(
                      'Seleccione un negocio',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(height: 20),
                    ...state.listBusiness
                        .map((e) => Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 5),
                              child:
                                  selectedBusiness(e.photo, e.name, () async {
                                businessBloc.add(BusinessSelectOneEvent(
                                    e.id,
                                    e.name,
                                    e.photo,
                                    businessBloc.state.listBusiness));
                                Navigator.pop(context);
                                print('########## >>>> ${e.id}');
                                await chargeAllProducts(context,
                                    idBusinnes: e.id);
                                print('########## FINALIZOOOO >>>> ${e.id}');
                              }),
                            ))
                        .toList()
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
