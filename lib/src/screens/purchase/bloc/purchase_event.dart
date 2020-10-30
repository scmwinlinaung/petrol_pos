import 'package:OilPos/src/screens/purchase/model/Purchase.dart';
import 'package:OilPos/src/screens/sale/model/Sale.dart';
import 'package:equatable/equatable.dart';

abstract class PurchaseEvent extends Equatable {
  const PurchaseEvent();

  @override
  List<Object> get props => [];
}

class CreatePurchaseButtonPressed extends PurchaseEvent {
  final Purchase purchase;
  const CreatePurchaseButtonPressed({this.purchase});

  @override
  List<Object> get props => [purchase];

  @override
  String toString() => 'CreatePurchaseButtonPressed { }';
}

class GetPurchasesList extends PurchaseEvent {
  final List<Purchase> purchase;
  const GetPurchasesList({this.purchase});

  @override
  List<Object> get props => [purchase];

  @override
  String toString() => 'GetPurchasesList { }';
}

class SearchingPurchases extends PurchaseEvent {
  final String searchString;

  SearchingPurchases(this.searchString);

  @override
  List<Object> get props => [searchString];

  @override
  String toString() => 'SearchingPurchases { }';
}

class DeletePurchase extends PurchaseEvent {
  final String id;

  DeletePurchase(this.id);

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'DeletePurchase { }';
}
