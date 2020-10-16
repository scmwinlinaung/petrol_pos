
import 'package:OilPos/src/screens/sale/model/Sale.dart';
import 'package:meta/meta.dart';

@immutable
class SaleState {
  final List<Sale> saleRecords;

  SaleState({
    this.saleRecords,
  });

  factory SaleState.initial() {
    return SaleState(
        saleRecords: []);
  }


  SaleState update({
    List<Sale> saleRecords
  }) {
    return copyWith(
      saleRecords: saleRecords,
    );
  }

  SaleState copyWith({
    List<Sale> saleRecords
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
