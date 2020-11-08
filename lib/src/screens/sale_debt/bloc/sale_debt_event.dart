import 'package:OilPos/src/screens/sale/model/Sale.dart';
import 'package:equatable/equatable.dart';

abstract class SaleDebtEvent extends Equatable {
  const SaleDebtEvent();

  @override
  List<Object> get props => [];
}

class GetSalesDebtList extends SaleDebtEvent {
  final int page;
  const GetSalesDebtList({this.page});

  @override
  List<Object> get props => [page];

  @override
  String toString() => 'GetSalesDebtList { }';
}
