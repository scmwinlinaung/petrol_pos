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
      print("GetSalesList");
      yield* _mapGetPurchasesList();
    } 
  }

  Stream<PurchaseState> _mapGetPurchasesList() async* {
    var jsonResponse = await apiCall.callPurchasesListApi();
    if (jsonResponse.length > 0) {
      final _purchaseList = jsonResponse.map((sale) {
        return Purchase(
            companyName: sale["companyName"],
            companyPhone: sale["companyPhone"],
            goodType: sale["goodType"],
            quantity: sale["quantity"],
            rateFixed: sale["rateFixed"],
            paymentType: sale["paymentType"],
            total: sale["total"]
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
