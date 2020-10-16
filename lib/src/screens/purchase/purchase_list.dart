import 'package:OilPos/src/screens/purchase/purchase_list_body.dart';

import 'package:flutter/cupertino.dart';

class PurchasesList extends StatefulWidget {
  @override
  _PurchasesListState createState() => _PurchasesListState();
}

class _PurchasesListState extends State<PurchasesList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal, child: PurchaseListBody());
  }
}
