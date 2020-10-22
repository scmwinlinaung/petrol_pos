import 'package:OilPos/src/screens/sale/model/Sale.dart';
import 'package:equatable/equatable.dart';

abstract class SaleEvent extends Equatable {
  const SaleEvent();

  @override
  List<Object> get props => [];
}

class CreateSaleButtonPressed extends SaleEvent {
  final Sale sale;
  const CreateSaleButtonPressed({this.sale});

  @override
  List<Object> get props => [sale];

  @override
  String toString() => 'CreateSaleButtonPressed { }';
}

class GetSalesList extends SaleEvent {
  final List<Sale> sale;
  const GetSalesList({this.sale});

  @override
  List<Object> get props => [sale];

  @override
  String toString() => 'GetSalesList { }';
}
