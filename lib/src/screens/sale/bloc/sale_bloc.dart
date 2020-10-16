import 'package:OilPos/src/common/api_call/api_call.dart';
import 'package:OilPos/src/screens/sale/model/Sale.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

class SaleBloc
    extends Bloc<SaleEvent, SaleState> {
  ApiCall apiCall = new ApiCallService();
  SaleBloc()
      : assert(true),
        super(SaleState.initial());

  @override
  Stream<SaleState> mapEventToState(
      SaleEvent event) async* {
    if (event is GetSalesList) {
      print("GetSalesList");
      yield* _mapGetSalesList();
    } 
  }

  Stream<SaleState> _mapGetSalesList() async* {
    var jsonResponse = await apiCall.callSalesListApi();
    if (jsonResponse.length > 0) {
      final _salesList = jsonResponse.map((sale) {
        return Sale(
            customerName: sale["customerName"],
            customerPhone: sale["customerPhone"],
            goodType: sale["goodType"],
            quantity: sale["quantity"],
            rateFixed: sale["rateFixed"],
            paymentType: sale["paymentType"],
            total: sale["total"]
            );
      }).toList();
      print("saleList = " + _salesList.toString());
      yield state.update(
        saleRecords: _salesList,
      );
    }
    
  }


  // }
}
