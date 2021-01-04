import 'package:OilPos/src/viewModels/sale/saleVIewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'createSaleForm.dart';

class CreateSale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("အရောင်းစာရင်းအသစ်",
              style: Theme.of(context).textTheme.headline1),
        ),
        body: ChangeNotifierProvider(
            create: (context) => SaleViewModel(),
            child: SingleChildScrollView(child: CreateSaleForm())));
  }
}
