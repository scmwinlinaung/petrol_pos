import 'package:OilPos/src/common/api_call/api_call.dart';
import 'package:OilPos/src/screens/sale/model/Sale.dart';
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
      yield* _mapGetSalesList();
    } else if (event is CreateSaleButtonPressed) {
      yield* _mapCreateSale(event.sale);
    }
  }

  Stream<SaleState> _mapCreateSale(Sale sale) async* {
    print(sale.customerPhone);
    print(sale.goodType);
    print(sale.quantity);
    print(sale.rateFixed);
    print(sale.paymentType);
    print(sale.total);
    try {
      await apiCall.callCreateSaleApi(
          sale.customerName,
          sale.customerPhone,
          sale.goodType,
          sale.quantity,
          sale.rateFixed,
          sale.paymentType,
          sale.total);
      yield SaleState.success();
    } catch (err) {
      yield SaleState.fail();
    }
  }

  Stream<SaleState> _mapGetSalesList() async* {
    var jsonResponse = await apiCall.callSalesListApi();
    print("Sale Record - " + jsonResponse["saleRecord"].toString());
    List saleRecords = jsonResponse["saleRecord"];
    if (saleRecords.length > 0) {
      final _salesList = saleRecords.map((sale) {
        DateTime parseCreatedDate =
            new DateFormat("yyyy-MM-ddThh:mm:s").parse(sale["createdAt"]);
        return Sale(
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

  // }
}
