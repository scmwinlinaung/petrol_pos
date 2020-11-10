import 'package:OilPos/src/screens/home/model/saleReport.dart';
import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetSaleReport extends HomeEvent {
  final List<SaleReport> saleReports;

  GetSaleReport({this.saleReports});

  @override
  List<Object> get props => [saleReports];

  @override
  String toString() => 'GetSaleReport { }';
}
