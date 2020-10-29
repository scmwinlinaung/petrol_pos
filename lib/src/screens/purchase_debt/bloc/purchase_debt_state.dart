import 'package:OilPos/src/screens/purchase/model/Purchase.dart';
import 'package:meta/meta.dart';

@immutable
class PurchaseDebtState {
  final List<Purchase> purchaseRecords;
  final bool isSuccess;
  final bool isFail;
  final String goodType;
  final String paymentType;
  final double purchaseDebtTotal;

  PurchaseDebtState(
      {this.purchaseRecords,
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
    return PurchaseDebtState(purchaseRecords: [], purchaseDebtTotal: 0);
  }

  PurchaseDebtState update(
      {List<Purchase> purchaseRecords,
      String goodType,
      String paymentType,
      double purchaseDebtTotal}) {
    return copyWith(
        purchaseRecords: purchaseRecords,
        goodType: goodType,
        paymentType: paymentType,
        purchaseDebtTotal: purchaseDebtTotal);
  }

  PurchaseDebtState copyWith(
      {List<Purchase> purchaseRecords,
      String goodType,
      String paymentType,
      double purchaseDebtTotal}) {
    return PurchaseDebtState(
        purchaseRecords: purchaseRecords ?? this.purchaseRecords,
        goodType: goodType ?? this.goodType,
        paymentType: paymentType ?? this.paymentType,
        purchaseDebtTotal: purchaseDebtTotal ?? this.purchaseDebtTotal);
  }

  @override
  String toString() {
    return '''PurchaseDebtState {
      purchaseRecords: $purchaseRecords,
    }''';
  }
}
