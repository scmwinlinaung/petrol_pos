import 'package:OilPos/src/common/api_call/api_call.dart';
import 'package:OilPos/src/models/inStock/inStockModel.dart';
import 'package:flutter/foundation.dart';

class InStockViewModel extends ChangeNotifier {
  List<InStockModel> inStockRecords = new List<InStockModel>();
  ApiCall apiCall = new ApiCallService();
  InStockViewModel() {
    this.getInStockList();
  }

  Future getInStockList() async {
    var jsonResponse = await apiCall.callInStockListApi();
    if (jsonResponse.length > 0) {
      this.inStockRecords = jsonResponse.map((inStock) {
        return InStockModel(
            stockType: inStock["stockType"], totalOfQty: inStock["totalOfQty"]);
      }).toList();
      notifyListeners();
    }
  }
}
