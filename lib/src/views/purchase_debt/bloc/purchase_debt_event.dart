import 'package:OilPos/src/views/sale/model/Sale.dart';
import 'package:equatable/equatable.dart';

abstract class PurchaseDebtEvent extends Equatable {
  const PurchaseDebtEvent();

  @override
  List<Object> get props => [];
}

class GetPurchasesDebtList extends PurchaseDebtEvent {
  final int page;
  const GetPurchasesDebtList({this.page});

  @override
  List<Object> get props => [page];

  @override
  String toString() => 'GetPurchasesList { }';
}
