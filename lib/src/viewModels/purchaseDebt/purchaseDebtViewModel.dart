import 'package:OilPos/src/common/api_call/api_call.dart';
import 'package:OilPos/src/models/purchase/purchase.dart';
import 'package:flutter/foundation.dart';

class PurchaseDebtViewModel extends ChangeNotifier {
  ApiCall apiCall = new ApiCallService();
  List<PurchaseModel> purchaseDebtRecords = new List<PurchaseModel>();
  int purchaseDebtTotal;
  int totalCount;

  PurchaseDebtViewModel() {
    this.getPurchaseDebtsList(0);
  }

  Future getPurchaseDebtsList(int page) async {
    var jsonResponse = await apiCall.callPurchaseDebtListApi(page);
    List purchaseDebtRecords = jsonResponse["purchaseRecord"];
    var totalCount = jsonResponse["meta"]["total"];
    var totalDebt = jsonResponse["meta"]["totalDebt"];
    if (jsonResponse.length > 0) {
      this.purchaseDebtRecords = purchaseDebtRecords.map((purchase) {
        return PurchaseModel(
            companyName: purchase["companyName"],
            companyPhone: purchase["companyPhone"],
            goodType: purchase["goodType"],
            quantity: purchase["quantity"],
            rateFixed: purchase["rateFixed"],
            paymentType: purchase["paymentType"],
            total: purchase["total"],
            createdAt: purchase["createdAt"]);
      }).toList();
      this.totalCount = totalCount;
      this.purchaseDebtTotal = totalDebt;
    }
  }
}
