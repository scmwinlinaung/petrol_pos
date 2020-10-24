import 'package:OilPos/src/screens/purchase/model/Purchase.dart';
import 'package:OilPos/src/screens/sale/model/Sale.dart';
import 'package:equatable/equatable.dart';

abstract class PurchaseDebtEvent extends Equatable {
  const PurchaseDebtEvent();

  @override
  List<Object> get props => [];
}

class GetPurchasesDebtList extends PurchaseDebtEvent {
  final List<Purchase> purchase;
  const GetPurchasesDebtList({this.purchase});

  @override
  List<Object> get props => [purchase];

  @override
  String toString() => 'GetPurchasesList { }';
}
