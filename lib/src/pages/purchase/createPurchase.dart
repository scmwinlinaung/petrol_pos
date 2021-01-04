import 'package:OilPos/src/viewModels/purchase/purchaseViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'createPurchaseForm.dart';

class CreatePurchase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("အဝယ်စာရင်းအသစ်",
              style: Theme.of(context).textTheme.headline1),
        ),
        body: ChangeNotifierProvider(
            create: (context) => PurchaseViewModel(),
            child: SingleChildScrollView(child: CreatePurchaseForm())));
  }
}
