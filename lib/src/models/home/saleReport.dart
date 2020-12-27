import 'package:equatable/equatable.dart';

class SaleReport {
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
  String toString() => 'SaleReport {  }';

  factory SaleReport.fromJson(Map<String, dynamic> saleReport) {
    return SaleReport(
        month: saleReport["_id"]["month"],
        goodType: saleReport["_id"]["goodType"],
        totalOfQty: saleReport["totalOfQty"],
        totalPrice: saleReport["totalPrice"]);
  }
}
