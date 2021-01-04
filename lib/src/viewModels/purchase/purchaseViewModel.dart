import 'package:OilPos/src/common/api_call/api_call.dart';
import 'package:OilPos/src/models/purchase/purchase.dart';
import 'package:flutter/foundation.dart';

class PurchaseViewModel extends ChangeNotifier {
  List<PurchaseModel> purchaseRecords = new List<PurchaseModel>();
  int totalCount = 0;
  ApiCall apiCall = new ApiCallService();

  PurchaseViewModel() {
    this.getPurchasesList(0);
  }

  Future<void> getPurchasesList(int page) async {
    var jsonResponse = await apiCall.callPurchasesListApi(page);
    List purchaseRecords = jsonResponse["purchaseRecord"];
    this.totalCount = jsonResponse["meta"]["total"];

    if (jsonResponse.length > 0) {
      this.purchaseRecords += purchaseRecords.map((purchase) {
        return PurchaseModel(
            id: purchase["_id"],
            companyName: purchase["companyName"],
            companyPhone: purchase["companyPhone"],
            goodType: purchase["goodType"],
            quantity: purchase["quantity"],
            rateFixed: purchase["rateFixed"],
            paymentType: purchase["paymentType"],
            total: purchase["total"],
            createdAt: purchase["createdAt"]);
      }).toList();
    }
    print(purchaseRecords);
    notifyListeners();
  }

  Future<void> createPurchase() async {
    notifyListeners();
  }

  Future<void> searchingPurchases() async {
    notifyListeners();
  }

  Future<void> deletePurchase() async {
    notifyListeners();
  }
}
