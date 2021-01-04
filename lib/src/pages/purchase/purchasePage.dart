import 'package:OilPos/src/pages/purchase/purchaseList.dart';
import 'package:OilPos/src/viewModels/purchase/purchaseViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'createPurchase.dart';

class PurchasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:
              Text("အဝယ်စာရင်း", style: Theme.of(context).textTheme.headline1),
        ),
        body: ChangeNotifierProvider(
            create: (context) => PurchaseViewModel(),
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical, child: PurchasesList())),
        floatingActionButton: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return CreatePurchase();
                }));
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              backgroundColor: Colors.green,
            ),
          ),
        ));
  }
}
