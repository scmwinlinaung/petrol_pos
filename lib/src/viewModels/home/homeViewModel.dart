import 'package:OilPos/src/common/api_call/api_call.dart';
import 'package:OilPos/src/models/home/saleReportModel.dart';
import 'package:OilPos/src/viewModels/home/saleReportViewModal.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  List<SaleReportViewModal> saleReports = List<SaleReportViewModal>();

  HomeViewModel() {
    this.getSaleReports(); // get data when home page opens
  }

  Future<void> getSaleReports() async {
    ApiCall apiCall = new ApiCallService();
    final results = await apiCall.callSaleReport();
    print("REPOST");
    this.saleReports = results
        .map((saleReport) => SaleReportViewModal(
            saleReport: SaleReportModel(
                month: saleReport["_id"]["month"],
                goodType: saleReport["_id"]["goodType"],
                totalOfQty: saleReport["totalOfQty"],
                totalPrice: saleReport["totalPrice"])))
        .toList();
    this.saleReports.sort((a, b) => a.month.compareTo(b.month));
    print("REPOST");
    print(this.saleReports);
    notifyListeners();
  }
}
