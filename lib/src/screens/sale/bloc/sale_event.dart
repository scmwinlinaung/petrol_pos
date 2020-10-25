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

class UpdatePaymentTypeButtonPressed extends SaleEvent {
  final String saleId;
  final String paymentType;
  const UpdatePaymentTypeButtonPressed({this.saleId, this.paymentType});

  @override
  List<Object> get props => [saleId, paymentType];

  @override
  String toString() => 'UpdatePaymentTypeButtonPressed { }';
}

class GetSalesList extends SaleEvent {
  const GetSalesList();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'GetSalesList { }';
}
