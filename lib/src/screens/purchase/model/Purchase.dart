import 'package:equatable/equatable.dart';

class Purchase extends Equatable {
  final String id;
  final String companyName;
  final String companyPhone;
  final String goodType;
  final int quantity;
  final int rateFixed;
  final String paymentType;
  final int total;
  final String status;
  final String createdAt;

  Purchase(
      {this.id,
      this.companyName,
      this.companyPhone,
      this.goodType,
      this.quantity,
      this.rateFixed,
      this.paymentType,
      this.total,
      this.status,
      this.createdAt});

  @override
  List<Object> get props => [
        id,
        companyName,
        companyPhone,
        goodType,
        quantity,
        rateFixed,
        paymentType,
        total,
        status,
        createdAt
      ];

  @override
  String toString() => 'Purchase { companyName: $companyName }';
}
