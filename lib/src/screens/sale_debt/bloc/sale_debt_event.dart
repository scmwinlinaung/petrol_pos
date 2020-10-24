import 'package:OilPos/src/screens/sale/model/Sale.dart';
import 'package:equatable/equatable.dart';

abstract class SaleDebtEvent extends Equatable {
  const SaleDebtEvent();

  @override
  List<Object> get props => [];
}

class GetSalesDebtList extends SaleDebtEvent {
  final List<Sale> sale;
  const GetSalesDebtList({this.sale});

  @override
  List<Object> get props => [sale];

  @override
  String toString() => 'GetSalesDebtList { }';
}
