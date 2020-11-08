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
      yield* _mapGetSalesDebtList(event.page);
    }
  }

  Stream<SaleDebtState> _mapGetSalesDebtList(int page) async* {
    var jsonResponse = await apiCall.callSalesDebtListApi(page, 10);
    List saleDebtRecords = jsonResponse["saleRecord"];
    var totalCount = jsonResponse["meta"]["total"];
    int totalDebt = jsonResponse["meta"]["totalDebt"];
    if (jsonResponse.length > 0) {
      final _salesDebtList = saleDebtRecords.map((saleDebt) {
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
          saleDebtRecords: _salesDebtList,
          totalCount: totalCount,
          saleDebtTotal: totalDebt);
    }
  }

  // }
}
