import 'package:OilPos/src/common/api_call/api_call.dart';
import 'package:OilPos/src/models/home/saleReportModel.dart';
import 'package:OilPos/src/viewModels/home/saleReportViewModal.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  List<SaleReportViewModal> dailySaleReports = List<SaleReportViewModal>();
  List<SaleReportViewModal> monthlySaleReports = List<SaleReportViewModal>();
  List<SaleReportViewModal> yearlySaleReports = List<SaleReportViewModal>();

  HomeViewModel() {
    this.getDailySaleReports(); // get data when home page opens
    this.getMonthlySaleReports();
    this.getYearlySaleReports();
  }

  Future<void> getDailySaleReports() async {
    ApiCall apiCall = new ApiCallService();
    final results = await apiCall.callDailySaleReport();
    this.dailySaleReports = results
        .map((saleReport) => SaleReportViewModal(
            saleReport: SaleReportModel(
                day: saleReport["_id"]["day"],
                month: saleReport["_id"]["month"],
                goodType: saleReport["_id"]["goodType"],
                totalOfQty: saleReport["totalOfQty"],
                totalPrice: saleReport["totalPrice"])))
        .toList();
    this.dailySaleReports.sort((a, b) => a.month.compareTo(b.month));
    notifyListeners();
  }

  Future<void> getMonthlySaleReports() async {
    ApiCall apiCall = new ApiCallService();
    final results = await apiCall.callMonthlySaleReport();
    this.monthlySaleReports = results
        .map((saleReport) => SaleReportViewModal(
            saleReport: SaleReportModel(
                day: saleReport["_id"]["day"],
                month: saleReport["_id"]["month"],
                goodType: saleReport["_id"]["goodType"],
                totalOfQty: saleReport["totalOfQty"],
                totalPrice: saleReport["totalPrice"])))
        .toList();
    this.monthlySaleReports.sort((a, b) => a.month.compareTo(b.month));
    notifyListeners();
  }

  Future<void> getYearlySaleReports() async {
    ApiCall apiCall = new ApiCallService();
    final results = await apiCall.callYearlySaleReport();
    this.yearlySaleReports = results
        .map((saleReport) => SaleReportViewModal(
            saleReport: SaleReportModel(
                day: saleReport["_id"]["day"],
                month: saleReport["_id"]["month"],
                goodType: saleReport["_id"]["goodType"],
                totalOfQty: saleReport["totalOfQty"],
                totalPrice: saleReport["totalPrice"])))
        .toList();
    this.yearlySaleReports.sort((a, b) => a.month.compareTo(b.month));
    notifyListeners();
  }
}
