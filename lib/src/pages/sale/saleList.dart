import 'package:OilPos/src/pages/sale/saleListBody.dart';
import 'package:flutter/cupertino.dart';

class SalesList extends StatefulWidget {
  @override
  _SalesListState createState() => _SalesListState();
}

class _SalesListState extends State<SalesList> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal, child: SaleListBody());
  }
}
