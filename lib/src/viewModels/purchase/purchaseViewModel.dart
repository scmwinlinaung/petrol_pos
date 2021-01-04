import 'package:OilPos/src/common/api_call/api_call.dart';
import 'package:OilPos/src/models/purchase/purchaseModel.dart';
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
    notifyListeners();
  }

  Future<void> createPurchase(PurchaseModel purchase) async {
    try {
      await apiCall.callCreatePurchaseApi(
          purchase.companyName,
          purchase.companyPhone,
          purchase.goodType,
          purchase.quantity,
          purchase.rateFixed,
          purchase.paymentType,
          purchase.total,
          purchase.createdAt);

      PurchaseModel.success();
      notifyListeners();
    } catch (err) {
      PurchaseModel.fail();
      notifyListeners();
    }
  }

  Future<void> searchingPurchases(String searchString) async {
    var jsonResponse = await apiCall.callSearchFromPurchases(searchString);
    List purchaseRecords = jsonResponse["purchaseRecord"];
    if (jsonResponse.length > 0) {
      this.purchaseRecords = purchaseRecords.map((purchase) {
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
      notifyListeners();
    }
  }

  Future<void> deletePurchase(String id) async {
    try {
      await apiCall.callDeletePurchase(id);
      await this.getPurchasesList(0);
      notifyListeners();
    } catch (err) {
      PurchaseModel.fail();
      notifyListeners();
    }
  }
}
