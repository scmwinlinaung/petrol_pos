import 'package:OilPos/src/screens/sale/model/Sale.dart';
import 'package:meta/meta.dart';

@immutable
class SaleDebtState {
  final List<Sale> saleDebtRecords;
  final int totalCount;
  final bool isSuccess;
  final bool isFail;
  final double saleDebtTotal;

  SaleDebtState(
      {this.saleDebtRecords,
      this.totalCount,
      this.isSuccess,
      this.isFail,
      this.saleDebtTotal});

  factory SaleDebtState.success() {
    return SaleDebtState(isFail: false, isSuccess: true);
  }

  factory SaleDebtState.fail() {
    return SaleDebtState(isFail: true, isSuccess: false);
  }

  factory SaleDebtState.initial() {
    return SaleDebtState(
        saleDebtRecords: [],
        isSuccess: false,
        isFail: false,
        saleDebtTotal: 0,
        totalCount: 0);
  }

  SaleDebtState update(
      {List<Sale> saleDebtRecords,
      int totalCount,
      String goodType,
      String paymentType,
      double saleDebtTotal}) {
    return copyWith(
        saleDebtRecords: saleDebtRecords,
        totalCount: totalCount,
        goodType: goodType,
        paymentType: paymentType,
        saleDebtTotal: saleDebtTotal);
  }

  SaleDebtState copyWith(
      {List<Sale> saleDebtRecords,
      int totalCount,
      String goodType,
      String paymentType,
      double saleDebtTotal}) {
    return SaleDebtState(
        saleDebtRecords: saleDebtRecords ?? this.saleDebtRecords,
        totalCount: totalCount ?? this.totalCount,
        saleDebtTotal: saleDebtTotal ?? this.saleDebtTotal);
  }

  @override
  String toString() {
    return '''SaleDebtState {
      saleDebtRecords: $saleDebtRecords,
    }''';
  }
}
