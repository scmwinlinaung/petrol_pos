import "dart:convert";
import "package:http/http.dart" as http;
import "../general.dart";

abstract class ApiCall {
  Future<dynamic> callSignInApi(String phoneNum, String password);
  Future<List> callSalesListApi();
  Future<List> callPurchasesListApi();
  Future<List> callInStockListApi();
  Future<dynamic> callCreateSaleApi(
      String customerName,
      String customerPhone,
      String goodType,
      int quantity,
      int rateFixed,
      String paymentType,
      int total);
}

class ApiCallService implements ApiCall {
  @override
  Future callSignInApi(String phoneNum, String password) async {
    var result = await http.post("$host/user_log_in",
        headers: {"Content-Type": "application/json"},
        body: json.encode({"phone": phoneNum, "password": password}));
    return json.decode(result.body);
  }

  @override
  Future<List> callSalesListApi() async {
    var result = await http.get(
      "$host/sale_records",
    );
    return json.decode(result.body) as List;
  }

  @override
  Future<List> callPurchasesListApi() async {
    var result = await http.get(
      "$host/purchase_records",
    );
    return json.decode(result.body) as List;
  }

  @override
  Future<List> callInStockListApi() async {
    var result = await http.get(
      "$host/in_stock_records",
    );
    return json.decode(result.body) as List;
  }

  @override
  Future<dynamic> callCreateSaleApi(
      String customerName,
      String customerPhone,
      String goodType,
      int quantity,
      int rateFixed,
      String paymentType,
      int total) async {
    var result = await http.post("$host/sale_records",
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "customerName": customerName,
          "customerPhone": customerPhone,
          "goodType": goodType,
          "quantity": quantity,
          "rateFixed": rateFixed,
          "paymentType": paymentType,
          "total": total,
          "status": "active"
        }));
    print(result.body);
    return json.decode(result.body);
  }
}
