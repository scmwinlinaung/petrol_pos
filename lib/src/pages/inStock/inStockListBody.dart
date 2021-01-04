import 'package:OilPos/src/viewModels/inStock/inStockViewModel.dart';
import 'package:OilPos/src/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InStockListBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<InStockViewModel>(
        builder: (context, inStockViewModel, child) {
      if (inStockViewModel.inStockRecords.length > 0) {
        return Container(
          width: MediaQuery.of(context).size.width,
          child: DataTable(
            headingRowColor: MaterialStateProperty.all(Colors.grey),
            headingTextStyle: TextStyle(color: Colors.white),
            columns: const <DataColumn>[
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
            ],
            rows: inStockViewModel
                .inStockRecords // Loops through dataColumnText, each iteration assigning the value to element
                .map(
                  ((sale) => DataRow(
                        cells: <DataCell>[
                          DataCell(Text(sale.stockType,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyText2)),
                          DataCell(Text(sale.totalOfQty.toString() + " လီတာ",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyText2)),
                        ],
                      )),
                )
                .toList(),
          ),
        );
      } else {
        return Center(child: LoadingIndicator());
      }
    });
  }
}
