import 'package:OilPos/src/viewModels/saleDebt/saleDebtVIewModel.dart';
import 'package:OilPos/src/views/sale/paginatedTableDataSourceForSale.dart';
import 'package:OilPos/src/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SaleDebtListBody extends StatefulWidget {
  @override
  _SaleDebtListBodyState createState() => _SaleDebtListBodyState();
}

class _SaleDebtListBodyState extends State<SaleDebtListBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SaleDebtViewModel>(
        builder: (context, saleDebtViewModel, child) {
      if (saleDebtViewModel.saleDebtRecords.length > 0) {
        return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: PaginatedDataTable(
              sortAscending: false,
              header: Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 50, 5),
                child: Text(
                    saleDebtViewModel.saleDebtTotal.toString() + " ကျပ်",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
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
              source: PaginatedTableDataSourceForSale(
                  data: saleDebtViewModel.saleDebtRecords,
                  totalCount: saleDebtViewModel.totalCount),
              onPageChanged: (page) {
                page = page ~/ 10;
                saleDebtViewModel.getSaleDebtsList(page);
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
