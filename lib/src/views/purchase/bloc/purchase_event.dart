import 'package:OilPos/src/views/purchase/model/Purchase.dart';
import 'package:OilPos/src/views/sale/model/Sale.dart';
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
  final int page;
  const GetPurchasesList({this.page});

  @override
  List<Object> get props => [page];

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
