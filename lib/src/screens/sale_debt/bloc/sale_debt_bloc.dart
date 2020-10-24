import 'package:OilPos/src/common/api_call/api_call.dart';
import 'package:OilPos/src/screens/sale/model/Sale.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'bloc.dart';

class SaleDebtBloc extends Bloc<SaleDebtEvent, SaleDebtState> {
  ApiCall apiCall = new ApiCallService();
  SaleDebtBloc()
      : assert(true),
        super(SaleDebtState.initial());

  @override
  Stream<SaleDebtState> mapEventToState(SaleDebtEvent event) async* {
    if (event is GetSalesDebtList) {
      print("GetSalesList");
      yield* _mapGetSalesList();
    }
  }

  Stream<SaleDebtState> _mapGetSalesList() async* {
    var jsonResponse = await apiCall.callSalesDebtListApi();
    if (jsonResponse.length > 0) {
      final _salesList = jsonResponse.map((saleDebt) {
        DateTime parseCreatedDate =
            new DateFormat("yyyy-MM-ddThh:mm:s").parse(saleDebt["createdAt"]);
        return Sale(
            customerName: saleDebt["customerName"],
            customerPhone: saleDebt["customerPhone"],
            goodType: saleDebt["goodType"],
            quantity: saleDebt["quantity"],
            rateFixed: saleDebt["rateFixed"],
            paymentType: saleDebt["paymentType"],
            total: saleDebt["total"],
            createdAt: parseCreatedDate.toString());
      }).toList();
      yield state.update(
        saleRecords: _salesList,
      );
    }
  }

  // }
}
