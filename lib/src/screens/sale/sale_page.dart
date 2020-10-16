import 'package:OilPos/src/screens/sale/sale_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SalePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("အရောင်းစာရင်း", style: Theme.of(context).textTheme.headline1),
      ),
      body: SingleChildScrollView(
        child: SalesList()
      ),
    );
  }

}