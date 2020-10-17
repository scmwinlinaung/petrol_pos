import 'package:equatable/equatable.dart';

class InStock extends Equatable {
  final String stockType;
  final int totalOfQty;
  final String status;

  InStock({ this.stockType, this.totalOfQty, this.status });

  
  @override
  List<Object> get props => [stockType, totalOfQty, status];

  @override
  String toString() => 'InStock { totalOfQty: $totalOfQty }';
}
