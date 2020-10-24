import 'package:OilPos/src/screens/purchase/model/Purchase.dart';
import 'package:meta/meta.dart';

@immutable
class PurchaseDebtState {
  final List<Purchase> purchaseRecords;
  final bool isSuccess;
  final bool isFail;
  final String goodType;
  final String paymentType;

  PurchaseDebtState(
      {this.purchaseRecords,
      this.isSuccess,
      this.isFail,
      this.goodType,
      this.paymentType});

  factory PurchaseDebtState.success() {
    return PurchaseDebtState(isFail: false, isSuccess: true);
  }

  factory PurchaseDebtState.fail() {
    return PurchaseDebtState(isFail: true, isSuccess: false);
  }

  factory PurchaseDebtState.initial() {
    return PurchaseDebtState(purchaseRecords: []);
  }

  PurchaseDebtState update({
    List<Purchase> purchaseRecords,
    String goodType,
    String paymentType,
  }) {
    return copyWith(
        purchaseRecords: purchaseRecords,
        goodType: goodType,
        paymentType: paymentType);
  }

  PurchaseDebtState copyWith({
    List<Purchase> purchaseRecords,
    String goodType,
    String paymentType,
  }) {
    return PurchaseDebtState(
        purchaseRecords: purchaseRecords ?? this.purchaseRecords,
        goodType: goodType ?? this.goodType,
        paymentType: paymentType ?? this.paymentType);
  }

  @override
  String toString() {
    return '''PurchaseDebtState {
      purchaseRecords: $purchaseRecords,
    }''';
  }
}
