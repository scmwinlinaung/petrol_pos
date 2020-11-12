import 'package:OilPos/src/screens/purchase/model/Purchase.dart';
import 'package:meta/meta.dart';

@immutable
class PurchaseState {
  final List<Purchase> purchaseRecords;
  final int totalCount;
  final bool isSuccess;
  final bool isFail;
  final String goodType;
  final String paymentType;

  PurchaseState(
      {this.purchaseRecords,
      this.totalCount,
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
    return PurchaseState(purchaseRecords: [], totalCount: 0);
  }

  PurchaseState update({
    List<Purchase> purchaseRecords,
    int totalCount,
    String goodType,
    String paymentType,
  }) {
    return copyWith(
        purchaseRecords: purchaseRecords,
        totalCount: totalCount,
        goodType: goodType,
        paymentType: paymentType);
  }

  PurchaseState copyWith({
    List<Purchase> purchaseRecords,
    int totalCount,
    String goodType,
    String paymentType,
  }) {
    return PurchaseState(
        purchaseRecords: purchaseRecords ?? this.purchaseRecords,
        totalCount: totalCount ?? this.totalCount,
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
