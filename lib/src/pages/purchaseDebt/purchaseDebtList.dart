import 'package:OilPos/src/views/purchase_debt/purchase_debt_list_body.dart';
import 'package:flutter/cupertino.dart';

class PurchasesDebtList extends StatefulWidget {
  @override
  _PurchasesDebtListState createState() => _PurchasesDebtListState();
}

class _PurchasesDebtListState extends State<PurchasesDebtList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal, child: PurchaseDebtListBody());
  }
}
