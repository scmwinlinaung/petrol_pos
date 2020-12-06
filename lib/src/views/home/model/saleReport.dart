import 'package:equatable/equatable.dart';

class SaleReport extends Equatable {
  final int month;
  final String goodType;
  final int totalOfQty;
  final int totalPrice;

  SaleReport({
    this.month,
    this.goodType,
    this.totalOfQty,
    this.totalPrice,
  });

  @override
  List<Object> get props => [
        month,
        goodType,
        totalOfQty,
        totalPrice,
      ];

  @override
  String toString() => 'SaleReport {  }';
}
