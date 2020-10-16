import 'package:equatable/equatable.dart';

class Sale extends Equatable {
  final String customerName;
  final String customerPhone;
  final String goodType;
  final int quantity;
  final int rateFixed;
  final String paymentType;
  final int total;
  final String status;

  Sale({ this.customerName, this.customerPhone, this.goodType, this.quantity, this.rateFixed, this.paymentType, this.total, this.status});
  
  @override
  List<Object> get props => [customerName, customerPhone, goodType, quantity, rateFixed, paymentType, total, status];

  @override
  String toString() => 'Sale { customerName: $customerName }';
}
