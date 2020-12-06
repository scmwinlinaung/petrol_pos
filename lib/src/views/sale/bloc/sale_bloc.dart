import 'package:OilPos/src/common/api_call/api_call.dart';
import 'package:OilPos/src/views/sale/model/Sale.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'bloc.dart';

class SaleBloc extends Bloc<SaleEvent, SaleState> {
  ApiCall apiCall = new ApiCallService();
  SaleBloc()
      : assert(true),
        super(SaleState.initial());

  @override
  Stream<SaleState> mapEventToState(SaleEvent event) async* {
    if (event is GetSalesList) {
      print("GetSalesList");
      yield* _mapGetSalesList(event.page);
    } else if (event is CreateSaleButtonPressed) {
      yield* _mapCreateSale(event.sale);
    } else if (event is SearchingSales) {
      yield* _mapSearchSalesList(event.searchString);
    } else if (event is DeleteSale) {
      yield* _mapDeleteSale(event.id);
    }
  }

  Stream<SaleState> _mapCreateSale(Sale sale) async* {
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
      yield SaleState.success();
    } catch (err) {
      yield SaleState.fail();
    }
  }

  Stream<SaleState> _mapGetSalesList(int page) async* {
    var jsonResponse = await apiCall.callSalesListApi(page);
    List saleRecords = jsonResponse["saleRecord"];
    var totalCount = jsonResponse["meta"]["total"];
    if (saleRecords.length > 0) {
      final _salesList = saleRecords.map((sale) {
        DateTime parseCreatedDate =
            new DateFormat("yyyy-MM-ddThh:mm:s").parse(sale["createdAt"]);
        return Sale(
            id: sale["_id"],
            customerName: sale["customerName"],
            customerPhone: sale["customerPhone"],
            goodType: sale["goodType"],
            quantity: sale["quantity"],
            rateFixed: sale["rateFixed"],
            paymentType: sale["paymentType"],
            total: sale["total"],
            createdAt: parseCreatedDate.toString());
      }).toList();
      yield state.update(saleRecords: _salesList, totalCount: totalCount);
    }
  }

  Stream<SaleState> _mapUpdatePaymentType(
      String saleId, String paymentType) async* {
    try {
      await apiCall.callUpdatePaymentTypeInSaleApi(saleId, paymentType);
      yield* _mapGetSalesList(0);
    } catch (err) {
      yield SaleState.fail();
    }
  }

  Stream<SaleState> _mapSearchSalesList(String searchString) async* {
    var jsonResponse = await apiCall.callSearchFromSales(searchString);
    print("Sale Record - " + jsonResponse["saleRecord"].toString());
    List saleRecords = jsonResponse["saleRecord"];
    if (saleRecords.length > 0) {
      final _salesList = saleRecords.map((sale) {
        DateTime parseCreatedDate =
            new DateFormat("yyyy-MM-ddThh:mm:s").parse(sale["createdAt"]);
        return Sale(
            id: sale["_id"],
            customerName: sale["customerName"],
            customerPhone: sale["customerPhone"],
            goodType: sale["goodType"],
            quantity: sale["quantity"],
            rateFixed: sale["rateFixed"],
            paymentType: sale["paymentType"],
            total: sale["total"],
            createdAt: parseCreatedDate.toString());
      }).toList();
      print("saleList = " + _salesList.toString());
      yield state.update(
        saleRecords: _salesList,
      );
    }
  }

  Stream<SaleState> _mapDeleteSale(String id) async* {
    try {
      await apiCall.callDeleteSale(id);
      yield* _mapGetSalesList(0);
    } catch (err) {
      SaleState.fail();
    }
  }

  // }
}