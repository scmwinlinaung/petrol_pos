import 'package:OilPos/src/views/sale_debt/sale_debt_list_body.dart';
import 'package:flutter/cupertino.dart';

class SalesDebtList extends StatefulWidget {
  @override
  _SalesDebtListState createState() => _SalesDebtListState();
}

class _SalesDebtListState extends State<SalesDebtList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal, child: SaleDebtListBody());
  }
}
