import 'package:OilPos/src/pages/saleDebt/saleDebtList.dart';
import 'package:OilPos/src/viewModels/saleDebt/saleDebtVIewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SaleDebtPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("အရောင်းကြွေးကျန်စာရင်း",
            style: Theme.of(context).textTheme.headline1),
      ),
      body: ChangeNotifierProvider(
          create: (context) => SaleDebtViewModel(),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical, child: SalesDebtList())),
    );
  }
}
