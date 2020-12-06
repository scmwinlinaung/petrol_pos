import 'package:OilPos/src/common/api_call/api_call.dart';
import 'package:OilPos/src/views/in_stock/model/InStock.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

class InStockBloc extends Bloc<InStockEvent, InStockState> {
  ApiCall apiCall = new ApiCallService();
  InStockBloc()
      : assert(true),
        super(InStockState.initial());

  @override
  Stream<InStockState> mapEventToState(InStockEvent event) async* {
    if (event is GetInStockList) {
      print("GetInStockList");
      yield* _mapGetInStockList();
    }
  }

  Stream<InStockState> _mapGetInStockList() async* {
    var jsonResponse = await apiCall.callInStockListApi();
    if (jsonResponse.length > 0) {
      final _inStockList = jsonResponse.map((inStock) {
        return InStock(
            stockType: inStock["stockType"], totalOfQty: inStock["totalOfQty"]);
      }).toList();
      print("_inStockList = " + _inStockList.toString());
      yield state.update(
        inStockRecords: _inStockList,
      );
    }
  }

  // }
}
