import "dart:convert";
import "package:http/http.dart" as http;
import "../general.dart";

abstract class ApiCall {
  Future<dynamic> callSignInApi(String phoneNum, String password);
  Future<dynamic> callSalesListApi();
  Future<List> callSalesDebtListApi();
  Future<List> callPurchaseDebtListApi();
  Future<dynamic> callPurchasesListApi();
  Future<List> callInStockListApi();
  Future<dynamic> callCreateSaleApi(
      String customerName,
      String customerPhone,
      String goodType,
      int quantity,
      int rateFixed,
      String paymentType,
      int total);
  Future<dynamic> callCreatePurchaseApi(
      String companyName,
      String companyPhone,
      String goodType,
      int quantity,
      int rateFixed,
      String paymentType,
      int total);

  Future<dynamic> callUpdatePaymentTypeInSaleApi(
      String saleId, String paymentType);
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
  Future<dynamic> callSalesListApi() async {
    var result = await http.get(
      "$host/sale_records_with_pagination?sort[createdAt]=-1",
    );
    return json.decode(result.body);
  }

  @override
  Future<dynamic> callPurchasesListApi() async {
    var result = await http.get(
      "$host/purchase_records_with_pagination?sort[createdAt]=-1",
    );
    return json.decode(result.body);
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

  @override
  Future<dynamic> callCreatePurchaseApi(
      String companyName,
      String companyPhone,
      String goodType,
      int quantity,
      int rateFixed,
      String paymentType,
      int total) async {
    var result = await http.post("$host/purchase_records",
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "companyName": companyName,
          "companyPhone": companyPhone,
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

  @override
  Future<List> callSalesDebtListApi() async {
    var result = await http.get(
      "$host/sale_debt_records",
    );
    return json.decode(result.body) as List;
  }

  @override
  Future<List> callPurchaseDebtListApi() async {
    var result = await http.get(
      "$host/purchase_debt_records",
    );
    return json.decode(result.body) as List;
  }

  @override
  Future callUpdatePaymentTypeInSaleApi(
      String saleId, String paymentType) async {
    var result = await http.put("$host/sale_records/" + saleId,
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "paymentType": paymentType,
        }));
    print(result.body);
    return json.decode(result.body);
  }
}
