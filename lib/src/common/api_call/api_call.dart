import "dart:convert";
import "package:http/http.dart" as http;
import "../general.dart";

abstract class ApiCall {
  Future<dynamic> callSignInApi(String name, String password);
  Future<dynamic> callSalesListApi(int page);
  Future<dynamic> callSalesDebtListApi(int limit, int page);
  Future<dynamic> callPurchaseDebtListApi(int page);
  Future<dynamic> callPurchasesListApi(int page);
  Future<List> callInStockListApi();
  Future<dynamic> callCreateSaleApi(
      String customerName,
      String customerPhone,
      String goodType,
      int quantity,
      int rateFixed,
      String paymentType,
      int total,
      String createdAt);
  Future<dynamic> callCreatePurchaseApi(
      String companyName,
      String companyPhone,
      String goodType,
      int quantity,
      int rateFixed,
      String paymentType,
      int total,
      String createdAt);

  Future<dynamic> callUpdatePaymentTypeInSaleApi(
      String saleId, String paymentType);

  Future<dynamic> callSearchFromPurchases(String searchString);

  Future<dynamic> callSearchFromSales(String searchString);
  Future<dynamic> callDeletePurchase(String id);
  Future<dynamic> callDeleteSale(String id);
  Future<List> callDailySaleReport();
  Future<List> callMonthlySaleReport();
  Future<List> callYearlySaleReport();
}

class ApiCallService implements ApiCall {
  @override
  Future callSignInApi(String name, String password) async {
    final url = Uri.parse("$host/user_log_in");
    var result = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: json.encode({"name": name, "password": password}));
    return json.decode(result.body);
  }

  @override
  Future<dynamic> callSalesListApi(int page) async {
    final url = Uri.parse(
        "$host/sale_records_with_pagination?sort[createdAt]=-1&&limit=10&&page=" +
            page.toString());
    var result = await http.get(
      url,
    );
    return json.decode(result.body);
  }

  @override
  Future<dynamic> callPurchasesListApi(int page) async {
    final url = Uri.parse(
        "$host/purchase_records_with_pagination?sort[createdAt]=-1&&limit=10&&page=" +
            page.toString());
    var result = await http.get(url);
    return json.decode(result.body);
  }

  @override
  Future<List> callInStockListApi() async {
    final url = Uri.parse("$host/in_stock_records");
    var result = await http.get(
      url,
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
      int total,
      String createAt) async {
    final url = Uri.parse("$host/sale_records");
    var result = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "customerName": customerName,
          "customerPhone": customerPhone,
          "goodType": goodType,
          "quantity": quantity,
          "rateFixed": rateFixed,
          "paymentType": paymentType,
          "total": total,
          "status": "active",
          "createdAt": createAt
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
      int total,
      String createAt) async {
    final url = Uri.parse("$host/purchase_records");
    var result = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "companyName": companyName,
          "companyPhone": companyPhone,
          "goodType": goodType,
          "quantity": quantity,
          "rateFixed": rateFixed,
          "paymentType": paymentType,
          "total": total,
          "status": "active",
          "createdAt": createAt
        }));
    print(result.body);
    return json.decode(result.body);
  }

  @override
  Future<dynamic> callSalesDebtListApi(int page, int limit) async {
    final url = Uri.parse(
        "$host/sale_debt_records_with_pagination?sort[createdAt]=-1&&limit=$limit&&page=$page");
    var result = await http.get(
      url,
    );
    return json.decode(result.body);
  }

  @override
  Future<dynamic> callPurchaseDebtListApi(int page) async {
    final url = Uri.parse(
        "$host/purchase_debt_records_with_pagination?sort[createdAt]=-1&&limit=10&&page=" +
            page.toString());
    var result = await http.get(
      url,
    );
    return json.decode(result.body);
  }

  @override
  Future callUpdatePaymentTypeInSaleApi(
      String saleId, String paymentType) async {
    final url = Uri.parse("$host/sale_records/" + saleId);
    var result = await http.put(url,
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "paymentType": paymentType,
        }));
    print(result.body);
    return json.decode(result.body);
  }

  @override
  Future callSearchFromPurchases(String searchString) async {
    final url = Uri.parse(
        "$host/purchase_records_with_pagination?sort[createdAt]=-1&&search=" +
            searchString);
    var result = await http.get(
      url,
    );
    return json.decode(result.body);
  }

  @override
  Future callSearchFromSales(String searchString) async {
    final url = Uri.parse(
        "$host/sale_records_with_pagination?sort[createdAt]=-1&&search=" +
            searchString);
    var result = await http.get(
      url,
    );
    return json.decode(result.body);
  }

  @override
  Future callDeletePurchase(String id) async {
    final url = Uri.parse("$host/purchase_records/" + id);
    var result = await http.delete(
      url,
      headers: {"Content-Type": "application/json"},
    );
    return json.decode(result.body);
  }

  @override
  Future callDeleteSale(String id) async {
    final url = Uri.parse("$host/sale_records/" + id);
    var result = await http.delete(
      url,
      headers: {"Content-Type": "application/json"},
    );
    return json.decode(result.body);
  }

  @override
  Future<List> callMonthlySaleReport() async {
    final url = Uri.parse("$host/monthly_sale_reports");
    var result = await http.get(
      url,
    );
    return json.decode(result.body) as List;
  }

  @override
  Future<List> callDailySaleReport() async {
    final url = Uri.parse("$host/daily_sale_reports");
    var result = await http.get(
      url,
    );
    return json.decode(result.body) as List;
  }

  @override
  Future<List> callYearlySaleReport() async {
    final url = Uri.parse("$host/yearly_sale_reports");
    var result = await http.get(
      url,
    );
    return json.decode(result.body) as List;
  }
}
