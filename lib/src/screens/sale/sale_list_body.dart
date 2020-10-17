import 'package:OilPos/src/screens/sale/bloc/sale_state.dart';
import 'package:OilPos/src/widgets/LoadingIndicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/sale_bloc.dart';

class SaleListBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SaleBloc, SaleState>(builder: (context, state) {
      if (state.saleRecords.length > 0) {
        return DataTable(
          headingRowColor: MaterialStateProperty.all(Colors.grey),
          headingTextStyle: TextStyle(color: Colors.white),
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
          ],
          rows: state
              .saleRecords // Loops through dataColumnText, each iteration assigning the value to element
              .map(
                ((sale) => DataRow(
                      cells: <DataCell>[
                        DataCell(Text(sale.customerName,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyText2)),
                        DataCell(Text(sale.customerPhone,
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
                        DataCell(Text(sale.paymentType,
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
