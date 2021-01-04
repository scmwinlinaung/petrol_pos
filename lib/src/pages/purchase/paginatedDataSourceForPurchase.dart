import 'package:OilPos/src/models/purchase/purchase.dart';

import 'package:flutter/material.dart';

class PaginatedTableDataSourceForPurchase extends DataTableSource {
  PaginatedTableDataSourceForPurchase({this.data, this.totalCount});
  // PurchaseBloc _purchaseBloc;

  final List<PurchaseModel> data;
  final int totalCount;

  // void deletePurchase(String id) {
  //   _purchaseBloc.add(DeletePurchase(id));
  // }

  @override
  DataRow getRow(int index) {
    if (index < data.length) {
      return DataRow.byIndex(
        index: index,
        cells: <DataCell>[
          DataCell(Text(
            data[index].companyName,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          )),
          DataCell(Text(
            data[index].companyPhone,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          )),
          DataCell(Text(
            data[index].goodType,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          )),
          DataCell(Text(
            data[index].quantity.toString() + " လီတာ",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          )),
          DataCell(Text(
            data[index].rateFixed.toString() + " ကျပ်",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          )),
          DataCell(Text(
            data[index].paymentType,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          )),
          DataCell(Text(
            data[index].total.toString() + " ကျပ်",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          )),
          DataCell(Text(
            data[index].createdAt.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          )),
          DataCell(IconButton(
            onPressed: () {
              // deletePurchase(data[index].id);
            },
            icon: Icon(Icons.delete, size: 30, color: Colors.red),
          ))
        ],
      );
    }
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => totalCount;

  @override
  int get selectedRowCount => 0;
}
