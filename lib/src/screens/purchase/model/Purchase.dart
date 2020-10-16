import 'package:equatable/equatable.dart';

class Purchase extends Equatable {
  final String companyName;
  final String companyPhone;
  final String goodType;
  final int quantity;
  final int rateFixed;
  final String paymentType;
  final int total;
  final String status;

  Purchase({ this.companyName, this.companyPhone, this.goodType, this.quantity, this.rateFixed, this.paymentType, this.total, this.status});
  
  @override
  List<Object> get props => [companyName, companyPhone, goodType, quantity, rateFixed, paymentType, total, status];

  @override
  String toString() => 'Purchase { companyName: $companyName }';
}
