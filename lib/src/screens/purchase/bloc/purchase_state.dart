import 'package:OilPos/src/screens/purchase/model/Purchase.dart';
import 'package:meta/meta.dart';

@immutable
class PurchaseState {
  final List<Purchase> purchaseRecords;

  PurchaseState({
    this.purchaseRecords,
  });

  factory PurchaseState.initial() {
    return PurchaseState(purchaseRecords: []);
  }

  PurchaseState update({List<Purchase> purchaseRecords}) {
    return copyWith(
      purchaseRecords: purchaseRecords,
    );
  }

  PurchaseState copyWith({List<Purchase> purchaseRecords}) {
    return PurchaseState(
      purchaseRecords: purchaseRecords ?? this.purchaseRecords,
    );
  }

  @override
  String toString() {
    return '''PurchaseState {
      purchaseRecords: $purchaseRecords,
    }''';
  }
}
