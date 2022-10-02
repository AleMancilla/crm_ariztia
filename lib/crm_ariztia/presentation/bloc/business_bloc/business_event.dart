part of 'business_bloc.dart';

@immutable
abstract class BusinessEvent {}

// class BusinessChangeEvent extends BusinessEvent {
//   String? id;
//   String? name;
//   final List<BusinessModel> lisBusiness;
//   BusinessChangeEvent(this.id, this.name, this.lisBusiness);
// }
class BusinessGetListEvent extends BusinessEvent {
  final List<BusinessModel> lisBusiness;
  BusinessGetListEvent(this.lisBusiness);
}

class BusinessSelectOneEvent extends BusinessEvent {
  String? id;
  String? name;
  String? photo;
  final List<BusinessModel> lisBusiness;
  BusinessSelectOneEvent(this.id, this.name, this.photo, this.lisBusiness);
}
