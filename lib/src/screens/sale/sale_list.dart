
import 'package:OilPos/src/screens/sale/sale_list_body.dart';
import 'package:OilPos/src/screens/sale/sale_list_header.dart';
import 'package:flutter/cupertino.dart';

class SalesList extends StatefulWidget {
  @override
  _SalesListState createState() => _SalesListState();
}

class _SalesListState extends State<SalesList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SaleListHeader(),
        SaleListBody()
      ],
    );
  }
}