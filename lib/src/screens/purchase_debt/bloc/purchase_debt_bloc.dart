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
      print("GetPurchasesList");
      yield* _mapGetPurchasesList();
    }
  }

  Stream<PurchaseDebtState> _mapGetPurchasesList() async* {
    var jsonResponse = await apiCall.callPurchaseDebtListApi();
    if (jsonResponse.length > 0) {
      final _purchaseList = jsonResponse.map((purchase) {
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
      print("saleList = " + _purchaseList.toString());
      yield state.update(
        purchaseRecords: _purchaseList,
      );
    }
  }

  // }
}
