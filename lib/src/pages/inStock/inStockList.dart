import 'package:flutter/cupertino.dart';
import 'inStockListBody.dart';

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
