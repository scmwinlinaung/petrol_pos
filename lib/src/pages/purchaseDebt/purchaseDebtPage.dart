import 'package:OilPos/src/pages/purchaseDebt/purchaseDebtList.dart';
import 'package:OilPos/src/viewModels/purchaseDebt/purchaseDebtViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PurchaseDebtPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("အဝယ်ကြွေးကျန်စာရင်း",
            style: Theme.of(context).textTheme.headline1),
      ),
      body: ChangeNotifierProvider(
          create: (context) => PurchaseDebtViewModel(),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical, child: PurchasesDebtList())),
    );
  }
}
