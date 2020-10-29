import 'package:OilPos/src/screens/sale/model/Sale.dart';
import 'package:meta/meta.dart';

@immutable
class SaleDebtState {
  final List<Sale> saleRecords;
  final bool isSuccess;
  final bool isFail;
  final double saleDebtTotal;

  SaleDebtState(
      {this.saleRecords, this.isSuccess, this.isFail, this.saleDebtTotal});

  factory SaleDebtState.success() {
    return SaleDebtState(isFail: false, isSuccess: true);
  }

  factory SaleDebtState.fail() {
    return SaleDebtState(isFail: true, isSuccess: false);
  }

  factory SaleDebtState.initial() {
    return SaleDebtState(
        saleRecords: [], isSuccess: false, isFail: false, saleDebtTotal: 0);
  }

  SaleDebtState update(
      {List<Sale> saleRecords,
      String goodType,
      String paymentType,
      double saleDebtTotal}) {
    return copyWith(
        saleRecords: saleRecords,
        goodType: goodType,
        paymentType: paymentType,
        saleDebtTotal: saleDebtTotal);
  }

  SaleDebtState copyWith(
      {List<Sale> saleRecords,
      String goodType,
      String paymentType,
      double saleDebtTotal}) {
    return SaleDebtState(
        saleRecords: saleRecords ?? this.saleRecords,
        saleDebtTotal: saleDebtTotal ?? this.saleDebtTotal);
  }

  @override
  String toString() {
    return '''SaleDebtState {
      saleRecords: $saleRecords,
    }''';
  }
}
