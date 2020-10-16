import 'package:OilPos/src/screens/purchase/bloc/bloc.dart';
import 'package:OilPos/src/widgets/LoadingIndicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/purchase_bloc.dart';

class PurchaseListBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchaseBloc, PurchaseState>(builder: (context, state) {
      print(state.purchaseRecords.toString());
      if (state.purchaseRecords.length > 0) {
        return DataTable(
          headingRowColor: MaterialStateProperty.all(Colors.grey),
          headingTextStyle: TextStyle(color: Colors.white),
          columns: const <DataColumn>[
            DataColumn(
              label: Text(
                'အမည်',
                style: TextStyle(fontSize: 14),
              ),
            ),
            DataColumn(
              label: Text(
                'ဖုန်း',
                style: TextStyle(fontSize: 14),
              ),
            ),
            DataColumn(
              label: Text(
                'အမျိုးအစား',
                style: TextStyle(fontSize: 14),
              ),
            ),
            DataColumn(
              label: Text(
                'အရေအတွက်',
                style: TextStyle(fontSize: 14),
              ),
            ),
            DataColumn(
              label: Text(
                'နှုန်း',
                style: TextStyle(fontSize: 14),
              ),
            ),
            DataColumn(
              label: Text(
                'ငွေပေးချေမည့်ပုံစံ',
                style: TextStyle(fontSize: 14),
              ),
            ),
            DataColumn(
              label: Text(
                'စုစုပေါင်း',
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
                            style: Theme.of(context).textTheme.bodyText2)),
                        DataCell(Text(sale.companyPhone,
                            style: Theme.of(context).textTheme.bodyText2)),
                        DataCell(Text(sale.goodType,
                            style: Theme.of(context).textTheme.bodyText2)),
                        DataCell(Text(sale.quantity.toString(),
                            style: Theme.of(context).textTheme.bodyText2)),
                        DataCell(Text(sale.rateFixed.toString(),
                            style: Theme.of(context).textTheme.bodyText2)),
                        DataCell(Text(sale.paymentType,
                            style: Theme.of(context).textTheme.bodyText2)),
                        DataCell(Text(sale.total.toString(),
                            style: Theme.of(context).textTheme.bodyText2)),
                      ],
                    )),
              )
              .toList(),
        );
      } else {
        return LoadingIndicator();
      }
    });
  }
}
