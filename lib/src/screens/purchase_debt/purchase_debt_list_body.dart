import 'package:OilPos/src/screens/purchase/paginatedDataSourceForPurchase.dart';
import 'package:OilPos/src/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';

class PurchaseDebtListBody extends StatefulWidget {
  @override
  _PurchaseDebtListBodyState createState() => _PurchaseDebtListBodyState();
}

class _PurchaseDebtListBodyState extends State<PurchaseDebtListBody> {
  PurchaseDebtBloc _purchaseDebtBloc;

  @override
  void initState() {
    _purchaseDebtBloc = BlocProvider.of(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchaseDebtBloc, PurchaseDebtState>(
        builder: (context, state) {
      print(state.purchaseDebtRecords.toString());
      if (state.purchaseDebtRecords.length > 0) {
        return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: PaginatedDataTable(
              sortAscending: false,
              header: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 5, 50, 5),
                  child: Text(
                    state.purchaseDebtTotal.toString() + " ကျပ်",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
              columns: [
                DataColumn(
                  label: Text(
                    'အမည်',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'ဖုန်း',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'အမျိုးအစား',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'အရေအတွက်',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'နှုန်း',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'ငွေပေးချေမည့်ပုံစံ',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'စုစုပေါင်း',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'ရက်စွဲ',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Delete',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
              showCheckboxColumn: true,
              source: PaginatedTableDataSourceForPurchase(
                  data: state.purchaseDebtRecords,
                  totalCount: state.totalCount),
              onPageChanged: (page) {
                page = page ~/ 10;
                _purchaseDebtBloc.add(GetPurchasesDebtList(page: page));
              },
              // onRowsPerPageChanged: (r) {
              //   setState(() {
              //     _rowPerPage = r;
              //   });
              // },
              // rowsPerPage: _rowPerPage,
            ));
      } else {
        return Center(child: LoadingIndicator());
      }
    });
  }
}
