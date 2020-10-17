import 'package:OilPos/src/screens/in_stock/model/InStock.dart';
import 'package:equatable/equatable.dart';

abstract class InStockEvent extends Equatable {
  const InStockEvent();

  @override
  List<Object> get props => [];
}

class GetInStockList extends InStockEvent {
  final List<InStock> inStockRecords;
  const GetInStockList({this.inStockRecords});

  @override
  List<Object> get props => [inStockRecords];

  @override
  String toString() => 'GetInStockList { }';
}