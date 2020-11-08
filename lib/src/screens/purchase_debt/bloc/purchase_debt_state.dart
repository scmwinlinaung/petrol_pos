import 'package:OilPos/src/screens/purchase/model/Purchase.dart';
import 'package:meta/meta.dart';

@immutable
class PurchaseDebtState {
  final List<Purchase> purchaseDebtRecords;
  final int totalCount;
  final bool isSuccess;
  final bool isFail;
  final String goodType;
  final String paymentType;
  final double purchaseDebtTotal;

  PurchaseDebtState(
      {this.purchaseDebtRecords,
      this.totalCount,
      this.isSuccess,
      this.isFail,
      this.goodType,
      this.paymentType,
      this.purchaseDebtTotal});

  factory PurchaseDebtState.success() {
    return PurchaseDebtState(isFail: false, isSuccess: true);
  }

  factory PurchaseDebtState.fail() {
    return PurchaseDebtState(isFail: true, isSuccess: false);
  }

  factory PurchaseDebtState.initial() {
    return PurchaseDebtState(
        purchaseDebtRecords: [], purchaseDebtTotal: 0, totalCount: 0);
  }

  PurchaseDebtState update(
      {List<Purchase> purchaseDebtRecords,
      int totalCount,
      String goodType,
      String paymentType,
      double purchaseDebtTotal}) {
    return copyWith(
        purchaseDebtRecords: purchaseDebtRecords,
        totalCount: totalCount,
        goodType: goodType,
        paymentType: paymentType,
        purchaseDebtTotal: purchaseDebtTotal);
  }

  PurchaseDebtState copyWith(
      {List<Purchase> purchaseDebtRecords,
      int totalCount,
      String goodType,
      String paymentType,
      double purchaseDebtTotal}) {
    return PurchaseDebtState(
        purchaseDebtRecords: purchaseDebtRecords ?? this.purchaseDebtRecords,
        totalCount: totalCount ?? this.totalCount,
        goodType: goodType ?? this.goodType,
        paymentType: paymentType ?? this.paymentType,
        purchaseDebtTotal: purchaseDebtTotal ?? this.purchaseDebtTotal);
  }

  @override
  String toString() {
    return '''PurchaseDebtState {
      purchaseDebtRecords: $purchaseDebtRecords,
    }''';
  }
}
