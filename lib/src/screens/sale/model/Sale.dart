import 'package:equatable/equatable.dart';

class Sale extends Equatable {
  final String id;
  final String customerName;
  final String customerPhone;
  final String goodType;
  final int quantity;
  final int rateFixed;
  final String paymentType;
  final int total;
  final String status;
  final String createdAt;

  Sale(
      {this.id,
      this.customerName,
      this.customerPhone,
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
        customerName,
        customerPhone,
        goodType,
        quantity,
        rateFixed,
        paymentType,
        total,
        status,
        createdAt
      ];

  @override
  String toString() => 'Sale { customerName: $customerName }';
}
