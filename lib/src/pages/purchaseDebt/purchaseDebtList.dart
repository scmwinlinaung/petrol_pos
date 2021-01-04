import 'package:OilPos/src/pages/purchaseDebt/purchaseDebtListBody.dart';
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
