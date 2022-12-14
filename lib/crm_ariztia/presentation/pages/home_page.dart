import 'package:ariztia_crm/core/function_utils.dart';
import 'package:ariztia_crm/crm_ariztia/presentation/bloc/business_bloc/business_bloc.dart';
import 'package:ariztia_crm/crm_ariztia/presentation/pages/selected_business_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // @override
  // void initState() {
  //   Future.delayed(Duration.zero, () {
  //     final BusinessBloc businessBloc =
  //         BlocProvider.of<BusinessBloc>(context, listen: false);

  //     print(businessBloc.state.listBusiness);
  //   });
  //   super.initState();
  // }

  String itemSelected = '';

  @override
  Widget build(BuildContext context) {
    final BusinessBloc businessBloc =
        BlocProvider.of<BusinessBloc>(context, listen: true);
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        print(businessBloc.state.listBusiness);
      }),
      body: Row(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: BlocBuilder<BusinessBloc, BusinessState>(
                  builder: (context, state) {
                    if (state.idBusiness == '' || state.idBusiness == null) {
                      return selectedBusinessDefauld(context);
                    } else {
                      return Column(
                        children: [
                          selectedBusiness(state.photo, state.nameBusiness, () {
                            print(businessBloc.state.listBusiness);
                            openBusinessSelectedOptions();
                          }),
                          itemBusinessOptions(
                            'Pedidos',
                            'assets/images/list_icon.png',
                          ),
                          itemBusinessOptions(
                            'Productos',
                            'assets/images/food_icono.png',
                          ),
                          itemBusinessOptions(
                            'Perfil',
                            'assets/images/profile_icon.png',
                          ),
                          itemBusinessOptions(
                            'Configuracion',
                            'assets/images/settings_icon.png',
                          ),
                        ],
                      );
                    }
                  },
                ),
              )
              // Container(
              //   color: Colors.white,
              //   child: Column(
              //     children: [
              //       Text('asd'),
              //     ],
              //   ),
              // ),
              ),
          Expanded(
            flex: 4,
            child: Container(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              child: Column(
                children: [
                  Text('asd'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  itemBusinessOptions(String title, String photo) {
    bool isSelected = title == itemSelected;
    return Material(
      child: InkWell(
        onTap: () {
          itemSelected = title;
          setState(() {});
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected
                ? Theme.of(context).primaryColor
                : Colors.transparent,
          ),
          child: Row(
            children: [
              Image.asset(
                photo,
                width: 40,
                height: 40,
                color: isSelected ? Colors.white : Colors.black87,
              ),
              SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  openBusinessSelectedOptions() {
    showDialog(
        context: context,
        builder: (context) {
          return SelectedBusinessOptions();
        });
  }

  selectedBusinessDefauld(BuildContext context) {
    return InkWell(
      onTap: openBusinessSelectedOptions,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 0.5, color: Colors.black38),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'assets/images/logo_app.png',
                  width: 50,
                  height: 50,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Seleccione un restaurant',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            Icon(
              Icons.arrow_drop_down_rounded,
              color: Theme.of(context).primaryColor,
              size: 40,
            )
          ],
        ),
      ),
    );
  }
}
