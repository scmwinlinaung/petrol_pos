import 'package:equatable/equatable.dart';

class InStockModel {
  String stockType;
  int totalOfQty;
  String status;

  InStockModel({this.stockType, this.totalOfQty, this.status});

  @override
  String toString() => 'InStock { totalOfQty: $totalOfQty }';
}
