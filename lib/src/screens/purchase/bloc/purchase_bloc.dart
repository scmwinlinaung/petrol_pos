import 'package:OilPos/src/common/api_call/api_call.dart';
import 'package:OilPos/src/screens/purchase/model/Purchase.dart';
import 'package:OilPos/src/screens/sale/model/Sale.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

class PurchaseBloc
    extends Bloc<PurchaseEvent, PurchaseState> {
  ApiCall apiCall = new ApiCallService();
  PurchaseBloc()
      : assert(true),
        super(PurchaseState.initial());

  @override
  Stream<PurchaseState> mapEventToState(
      PurchaseEvent event) async* {
    if (event is GetPurchasesList) {
      print("GetPurchasesList");
      yield* _mapGetPurchasesList();
    }  else if (event is CreatePurchaseButtonPressed) {
      yield* _mapCreatePurchase(event.purchase);
    } 
  }

    Stream<PurchaseState> _mapCreatePurchase(Purchase purchase) async* {

    try {
      await apiCall.callCreatePurchaseApi(
          purchase.companyName,
          purchase.companyPhone,
          purchase.goodType,
          purchase.quantity,
          purchase.rateFixed,
          purchase.paymentType,
          purchase.total);
      yield PurchaseState.success();
    } catch (err) {
      yield PurchaseState.fail();
    }
  }

  Stream<PurchaseState> _mapGetPurchasesList() async* {
    var jsonResponse = await apiCall.callPurchasesListApi();
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
            createdAt: purchase["createdAt"]
            );
      }).toList();
      print("saleList = " + _purchaseList.toString());
      yield state.update(
        purchaseRecords: _purchaseList,
      );
    }
    
  }


  // }
}
