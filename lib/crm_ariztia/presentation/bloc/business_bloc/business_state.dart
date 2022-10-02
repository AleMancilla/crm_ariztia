part of 'business_bloc.dart';

@immutable
abstract class BusinessState {
  String idBusiness;
  String nameBusiness;
  String photo;
  List<BusinessModel> listBusiness;
  // BusinessState();
  BusinessState(
      this.idBusiness, this.nameBusiness, this.photo, this.listBusiness);
}

class BusinessInitial extends BusinessState {
  BusinessInitial() : super('null', 'null', 'null', []);
}

class BusinessSelectedState extends BusinessState {
  final String id;
  final String name;
  final String photo;
  List<BusinessModel> list;
  BusinessSelectedState(this.id, this.name, this.photo, this.list)
      : super(id, name, photo, list);
}

class BusinessListState extends BusinessState {
  List<BusinessModel> listBusiness;
  BusinessListState(this.listBusiness) : super('', '', '', listBusiness);
}
