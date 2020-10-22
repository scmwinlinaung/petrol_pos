import 'package:OilPos/src/screens/sale/model/Sale.dart';
import 'package:meta/meta.dart';

@immutable
class SaleState {
  final List<Sale> saleRecords;
  final bool isSuccess;
  final bool isFail;

  SaleState(
      {this.saleRecords,
      this.isSuccess,
      this.isFail,});

  factory SaleState.success() {
    return SaleState(isFail: false, isSuccess: true);
  }

  factory SaleState.fail() {
    return SaleState(isFail: true, isSuccess: false);
  }

  factory SaleState.initial() {
    return SaleState(
        saleRecords: [],
        isSuccess: false,
        isFail: false,);
  }

  SaleState update({
    List<Sale> saleRecords,
    String goodType,
    String paymentType,
  }) {
    return copyWith(
      saleRecords: saleRecords,
      goodType: goodType,
      paymentType: paymentType
    );
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
