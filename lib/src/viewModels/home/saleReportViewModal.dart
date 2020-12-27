import 'package:OilPos/src/models/home/saleReport.dart';

class SaleReportViewModal {
  final SaleReport saleReport;

  SaleReportViewModal({this.saleReport});

  int get month {
    return this.saleReport.month;
  }

  String get goodType {
    return this.saleReport.goodType;
  }

  int get totalOfQty {
    return this.saleReport.totalOfQty;
  }

  int get totalPrice {
    return this.saleReport.totalPrice;
  }
}
