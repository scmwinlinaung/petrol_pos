import 'package:OilPos/src/common/api_call/api_call.dart';
import 'package:OilPos/src/views/home/model/saleReport.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:OilPos/src/widgets/group_bar_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  ApiCall apiCall = new ApiCallService();
  HomeBloc()
      : assert(true),
        super(HomeState.initial());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is GetSaleReport) {
      yield* _mapGetSaleReport();
    }
  }

  Stream<HomeState> _mapGetSaleReport() async* {
    var jsonResponse = await apiCall.callSaleReport();
    if (jsonResponse.length > 0) {
      final _saleReportList = jsonResponse.map((saleReport) {
        return SaleReport(
            month: saleReport["_id"]["month"],
            goodType: saleReport["_id"]["goodType"],
            totalOfQty: saleReport["totalOfQty"],
            totalPrice: saleReport["totalPrice"]);
      }).toList();

      _saleReportList.sort((a, b) => a.month.compareTo(b.month));

      yield state.update(
        saleReports: _saleReportList,
      );
    }
  }
}
