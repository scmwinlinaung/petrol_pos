import 'package:OilPos/src/views/in_stock/bloc/bloc.dart';
import 'package:OilPos/src/views/in_stock/bloc/in_stock_bloc.dart';
import 'package:OilPos/src/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InStockListBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InStockBloc, InStockState>(builder: (context, state) {
      print(state.inStockRecords.toString());
      if (state.inStockRecords.length > 0) {
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
            rows: state
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
