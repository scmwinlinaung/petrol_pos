import 'package:OilPos/src/screens/sale/model/Sale.dart';
import 'package:meta/meta.dart';

@immutable
class SaleState {
  final List<Sale> saleRecords;
  final bool isSuccess;
  final bool isFail;
  final bool loading;

  SaleState({this.saleRecords, this.isSuccess, this.isFail, this.loading});

  factory SaleState.loading() {
    return SaleState(isFail: false, isSuccess: true, loading: true);
  }

  factory SaleState.success() {
    return SaleState(isFail: false, isSuccess: true, loading: false);
  }

  factory SaleState.fail() {
    return SaleState(isFail: true, isSuccess: false, loading: false);
  }

  factory SaleState.initial() {
    return SaleState(
        saleRecords: [], isSuccess: false, isFail: false, loading: false);
  }

  SaleState update({
    List<Sale> saleRecords,
    String goodType,
    String paymentType,
  }) {
    return copyWith(
        saleRecords: saleRecords, goodType: goodType, paymentType: paymentType);
  }

  SaleState copyWith({
    List<Sale> saleRecords,
    String goodType,
    String paymentType,
  }) {
    return SaleState(
      saleRecords: saleRecords ?? this.saleRecords,
    );
  }

  @override
  String toString() {
    return '''SaleState {
      saleRecords: $saleRecords,
    }''';
  }
}
