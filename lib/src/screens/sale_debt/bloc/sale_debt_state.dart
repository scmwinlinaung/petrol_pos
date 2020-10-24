import 'package:OilPos/src/screens/sale/model/Sale.dart';
import 'package:meta/meta.dart';

@immutable
class SaleDebtState {
  final List<Sale> saleRecords;
  final bool isSuccess;
  final bool isFail;

  SaleDebtState({
    this.saleRecords,
    this.isSuccess,
    this.isFail,
  });

  factory SaleDebtState.success() {
    return SaleDebtState(isFail: false, isSuccess: true);
  }

  factory SaleDebtState.fail() {
    return SaleDebtState(isFail: true, isSuccess: false);
  }

  factory SaleDebtState.initial() {
    return SaleDebtState(
      saleRecords: [],
      isSuccess: false,
      isFail: false,
    );
  }

  SaleDebtState update({
    List<Sale> saleRecords,
    String goodType,
    String paymentType,
  }) {
    return copyWith(
        saleRecords: saleRecords, goodType: goodType, paymentType: paymentType);
  }

  SaleDebtState copyWith({
    List<Sale> saleRecords,
    String goodType,
    String paymentType,
  }) {
    return SaleDebtState(
      saleRecords: saleRecords ?? this.saleRecords,
    );
  }

  @override
  String toString() {
    return '''SaleDebtState {
      saleRecords: $saleRecords,
    }''';
  }
}
