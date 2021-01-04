import 'package:OilPos/src/common/api_call/api_call.dart';
import 'package:OilPos/src/models/sale/saleModel.dart';
import 'package:flutter/foundation.dart';

class SaleDebtViewModel extends ChangeNotifier {
  ApiCall apiCall = new ApiCallService();
  List<SaleModel> saleDebtRecords = new List<SaleModel>();
  int saleDebtTotal;
  int totalCount;

  SaleDebtViewModel() {
    this.getSaleDebtsList(0);
  }

  Future getSaleDebtsList(int page) async {
    var jsonResponse = await apiCall.callSalesDebtListApi(page, 10);
    List saleDebtRecords = jsonResponse["saleRecord"];
    var totalCount = jsonResponse["meta"]["total"];
    var totalDebt = jsonResponse["meta"]["totalDebt"];
    if (jsonResponse.length > 0) {
      this.saleDebtRecords += saleDebtRecords.map((purchase) {
        return SaleModel(
            customerName: purchase["customerName"],
            customerPhone: purchase["customerPhone"],
            goodType: purchase["goodType"],
            quantity: purchase["quantity"],
            rateFixed: purchase["rateFixed"],
            paymentType: purchase["paymentType"],
            total: purchase["total"],
            createdAt: purchase["createdAt"]);
      }).toList();
      this.totalCount = totalCount;
      this.saleDebtTotal = totalDebt;
      notifyListeners();
    }
  }
}
