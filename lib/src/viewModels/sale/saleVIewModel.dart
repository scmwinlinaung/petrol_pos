import 'package:OilPos/src/common/api_call/api_call.dart';
import 'package:OilPos/src/models/sale/saleModel.dart';
import 'package:flutter/foundation.dart';

class SaleViewModel extends ChangeNotifier {
  List<SaleModel> saleRecords = new List<SaleModel>();
  int totalCount = 0;
  ApiCall apiCall = new ApiCallService();

  SaleViewModel() {
    this.getSalesList(0);
  }

  Future<void> getSalesList(int page) async {
    var jsonResponse = await apiCall.callSalesListApi(page);
    List saleRecords = jsonResponse["saleRecord"];
    this.totalCount = jsonResponse["meta"]["total"];

    if (jsonResponse.length > 0) {
      this.saleRecords += saleRecords.map((sale) {
        return SaleModel(
            id: sale["_id"],
            customerName: sale["customerName"],
            customerPhone: sale["customerPhone"],
            goodType: sale["goodType"],
            quantity: sale["quantity"],
            rateFixed: sale["rateFixed"],
            paymentType: sale["paymentType"],
            total: sale["total"],
            createdAt: sale["createdAt"]);
      }).toList();
    }
    notifyListeners();
  }

  Future<void> createSale(SaleModel sale) async {
    try {
      await apiCall.callCreateSaleApi(
          sale.customerName,
          sale.customerPhone,
          sale.goodType,
          sale.quantity,
          sale.rateFixed,
          sale.paymentType,
          sale.total,
          sale.createdAt);

      SaleModel.success();
      notifyListeners();
    } catch (err) {
      SaleModel.fail();
      notifyListeners();
    }
  }

  Future<void> searchingSales(String searchString) async {
    var jsonResponse = await apiCall.callSearchFromSales(searchString);
    List saleRecords = jsonResponse["saleRecord"];
    if (jsonResponse.length > 0) {
      this.saleRecords = saleRecords.map((sale) {
        return SaleModel(
            id: sale["_id"],
            customerName: sale["customerName"],
            customerPhone: sale["customerPhone"],
            goodType: sale["goodType"],
            quantity: sale["quantity"],
            rateFixed: sale["rateFixed"],
            paymentType: sale["paymentType"],
            total: sale["total"],
            createdAt: sale["createdAt"]);
      }).toList();
      notifyListeners();
    }
  }

  Future<void> deleteSale(String id) async {
    try {
      await apiCall.callDeleteSale(id);
      await this.getSalesList(0);
      notifyListeners();
    } catch (err) {
      SaleModel.fail();
      notifyListeners();
    }
  }
}
