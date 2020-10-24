import 'package:OilPos/src/widgets/LoadingIndicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';

class PurchaseDebtListBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchaseDebtBloc, PurchaseDebtState>(
        builder: (context, state) {
      print(state.purchaseRecords.toString());
      if (state.purchaseRecords.length > 0) {
        return DataTable(
          headingRowColor: MaterialStateProperty.all(Colors.grey),
          headingTextStyle: TextStyle(color: Colors.white),
          sortAscending: false,
          columns: const <DataColumn>[
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
          ],
          rows: state
              .purchaseRecords // Loops through dataColumnText, each iteration assigning the value to element
              .map(
                ((sale) => DataRow(
                      cells: <DataCell>[
                        DataCell(Text(sale.companyName,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText2)),
                        DataCell(Text(sale.companyPhone,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText2)),
                        DataCell(Text(sale.goodType,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText2)),
                        DataCell(Text(sale.quantity.toString() + " လီတာ",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText2)),
                        DataCell(Text(sale.rateFixed.toString() + " ကျပ်",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText2)),
                        DataCell(Text(sale.total.toString() + " ကျပ်",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText2)),
                        DataCell(Text(sale.createdAt,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText2)),
                      ],
                    )),
              )
              .toList(),
        );
      } else {
        return Center(child: LoadingIndicator());
      }
    });
  }
}
