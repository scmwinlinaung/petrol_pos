import 'package:OilPos/src/screens/purchase/bloc/bloc.dart';
import 'package:OilPos/src/widgets/LoadingIndicator.dart';
import 'package:OilPos/src/widgets/paginatedTableDataSourceForPurchase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/purchase_bloc.dart';

class PurchaseListBody extends StatefulWidget {
  @override
  _PurchaseListBodyState createState() => _PurchaseListBodyState();
}

class _PurchaseListBodyState extends State<PurchaseListBody> {
  PurchaseBloc _purchaseBloc;
  int _rowPerPage = PaginatedDataTable.defaultRowsPerPage;
  TextEditingController _searchStringCtrl = new TextEditingController();

  @override
  void initState() {
    _purchaseBloc = BlocProvider.of(context);
    _searchStringCtrl.addListener(liveSearching);
    super.initState();
  }

  void liveSearching() {
    _purchaseBloc.add(SearchingPurchases(_searchStringCtrl.text));
  }

  void deletePurchase(String id) {
    _purchaseBloc.add(DeletePurchase(id));
  }

  @override
  void dispose() {
    _searchStringCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchaseBloc, PurchaseState>(builder: (context, state) {
      print(state.purchaseRecords.toString());
      if (state.purchaseRecords.length > 0) {
        return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: PaginatedDataTable(
              sortAscending: false,
              header: Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 50, 5),
                child: TextFormField(
                  controller: _searchStringCtrl,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Theme.of(context).primaryColor,
                    ),
                    labelText: "Search",
                    labelStyle: Theme.of(context).textTheme.bodyText1,
                  ),
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
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
                  data: state.purchaseRecords, totalCount: state.totalCount),
              onPageChanged: (page) {
                page = page ~/ 10;
                _purchaseBloc.add(GetPurchasesList(page: page));
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
