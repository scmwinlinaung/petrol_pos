import 'package:OilPos/src/screens/purchase/model/Purchase.dart';
import 'package:meta/meta.dart';

@immutable
class PurchaseState {
  final List<Purchase> purchaseRecords;
  final bool isSuccess;
  final bool isFail;
  final String goodType;
  final String paymentType;

  PurchaseState(
      {this.purchaseRecords,
      this.isSuccess,
      this.isFail,
      this.goodType,
      this.paymentType});

  factory PurchaseState.success() {
    return PurchaseState(isFail: false, isSuccess: true);
  }

  factory PurchaseState.fail() {
    return PurchaseState(isFail: true, isSuccess: false);
  }

  factory PurchaseState.initial() {
    return PurchaseState(purchaseRecords: []);
  }

  PurchaseState update({
    List<Purchase> purchaseRecords,
    String goodType,
    String paymentType,
  }) {
    return copyWith(
        purchaseRecords: purchaseRecords,
        goodType: goodType,
        paymentType: paymentType);
  }

  PurchaseState copyWith({
    List<Purchase> purchaseRecords,
    String goodType,
    String paymentType,
  }) {
    return PurchaseState(
        purchaseRecords: purchaseRecords ?? this.purchaseRecords,
        goodType: goodType ?? this.goodType,
        paymentType: paymentType ?? this.paymentType);
  }

  @override
  String toString() {
    return '''PurchaseState {
      purchaseRecords: $purchaseRecords,
    }''';
  }
}
