import 'package:OilPos/src/common/api_call/api_call.dart';
import 'package:OilPos/src/views/purchase/model/Purchase.dart';
import 'package:OilPos/src/views/sale/model/Sale.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

class PurchaseBloc extends Bloc<PurchaseEvent, PurchaseState> {
  ApiCall apiCall = new ApiCallService();
  PurchaseBloc()
      : assert(true),
        super(PurchaseState.initial());

  @override
  Stream<PurchaseState> mapEventToState(PurchaseEvent event) async* {
    if (event is GetPurchasesList) {
      yield* _mapGetPurchasesList(event.page);
    } else if (event is CreatePurchaseButtonPressed) {
      yield* _mapCreatePurchase(event.purchase);
    } else if (event is SearchingPurchases) {
      yield* _mapSearchPurchasesList(event.searchString);
    } else if (event is DeletePurchase) {
      yield* _mapDeletePurchase(event.id);
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
          purchase.total,
          purchase.createdAt);
      yield PurchaseState.success();
    } catch (err) {
      yield PurchaseState.fail();
    }
  }

  Stream<PurchaseState> _mapGetPurchasesList(int page) async* {
    var jsonResponse = await apiCall.callPurchasesListApi(page);
    List purchaseRecords = jsonResponse["purchaseRecord"];
    var totalCount = jsonResponse["meta"]["total"];
    if (jsonResponse.length > 0) {
      final _purchaseList = purchaseRecords.map((purchase) {
        return Purchase(
            id: purchase["_id"],
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
          purchaseRecords: state.purchaseRecords + _purchaseList,
          totalCount: totalCount);
    }
  }

  Stream<PurchaseState> _mapSearchPurchasesList(String searchString) async* {
    var jsonResponse = await apiCall.callSearchFromPurchases(searchString);
    List purchaseRecords = jsonResponse["purchaseRecord"];
    if (jsonResponse.length > 0) {
      final _purchaseList = purchaseRecords.map((purchase) {
        return Purchase(
            id: purchase["_id"],
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
        purchaseRecords: _purchaseList,
      );
    }
  }

  Stream<PurchaseState> _mapDeletePurchase(String id) async* {
    try {
      await apiCall.callDeletePurchase(id);
      yield* _mapGetPurchasesList(0);
    } catch (err) {
      PurchaseState.fail();
    }
  }

  // }
}
