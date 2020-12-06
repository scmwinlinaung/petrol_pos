import 'package:OilPos/src/views/in_stock/model/InStock.dart';
import 'package:meta/meta.dart';

@immutable
class InStockState {
  final List<InStock> inStockRecords;

  InStockState({
    this.inStockRecords,
  });

  factory InStockState.initial() {
    return InStockState(inStockRecords: []);
  }

  InStockState update({List<InStock> inStockRecords}) {
    return copyWith(
      inStockRecords: inStockRecords,
    );
  }

  InStockState copyWith({List<InStock> inStockRecords}) {
    return InStockState(
      inStockRecords: inStockRecords ?? this.inStockRecords,
    );
  }

  @override
  String toString() {
    return '''InStockState {
      inStockRecords: $inStockRecords,
    }''';
  }
}
