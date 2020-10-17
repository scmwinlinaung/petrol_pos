import 'package:flutter/cupertino.dart';
import 'in_stock_list_body.dart';

class InStockList extends StatefulWidget {
  @override
  _InStockListState createState() => _InStockListState();
}

class _InStockListState extends State<InStockList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal, child: InStockListBody());
  }
}
