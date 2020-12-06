import 'package:OilPos/src/views/home/model/saleReport.dart';
import 'package:meta/meta.dart';

@immutable
class HomeState {
  final List<SaleReport> saleReports;

  HomeState({this.saleReports});

  factory HomeState.initial() {
    return HomeState(saleReports: []);
  }

  HomeState update({List<SaleReport> saleReports}) {
    return copyWith(saleReports: saleReports);
  }

  HomeState copyWith({List<SaleReport> saleReports}) {
    return HomeState(saleReports: saleReports ?? this.saleReports);
  }
}
