import 'package:OilPos/src/common/api_call/api_call.dart';
import 'package:OilPos/src/screens/purchase/model/Purchase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

class PurchaseDebtBloc extends Bloc<PurchaseDebtEvent, PurchaseDebtState> {
  ApiCall apiCall = new ApiCallService();
  PurchaseDebtBloc()
      : assert(true),
        super(PurchaseDebtState.initial());

  @override
  Stream<PurchaseDebtState> mapEventToState(PurchaseDebtEvent event) async* {
    if (event is GetPurchasesDebtList) {
      yield* _mapGetPurchasesList(event.page);
    }
  }

  Stream<PurchaseDebtState> _mapGetPurchasesList(int page) async* {
    var jsonResponse = await apiCall.callPurchaseDebtListApi(page);
    List purchaseDebtRecords = jsonResponse["purchaseRecord"];
    var totalCount = jsonResponse["meta"]["total"];
    var totalDebt = jsonResponse["meta"]["totalDebt"];
    if (jsonResponse.length > 0) {
      final _purchaseDebtList = purchaseDebtRecords.map((purchase) {
        return Purchase(
            companyName: purchase["companyName"],
            companyPhone: purchase["companyPhone"],
            goodType: purchase["goodType"],
            quantity: purchase["quantity"],
            rateFixed: purchase["rateFixed"],
            paymentType: purchase["paymentType"],
            total: purchase["total"],
            createdAt: purchase["createdAt"]);
      }).toList();
      yield state.update(
          purchaseDebtRecords: _purchaseDebtList,
          totalCount: totalCount,
          purchaseDebtTotal: totalDebt);
    }
  }

  // }
}
