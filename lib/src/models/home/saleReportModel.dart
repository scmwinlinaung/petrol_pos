class SaleReportModel {
  final int month;
  final String goodType;
  final int totalOfQty;
  final int totalPrice;

  SaleReportModel({
    this.month,
    this.goodType,
    this.totalOfQty,
    this.totalPrice,
  });

  @override
  String toString() => 'SaleReport {  }';

  factory SaleReportModel.fromJson(Map<String, dynamic> saleReport) {
    return SaleReportModel(
        month: saleReport["_id"]["month"],
        goodType: saleReport["_id"]["goodType"],
        totalOfQty: saleReport["totalOfQty"],
        totalPrice: saleReport["totalPrice"]);
  }
}
