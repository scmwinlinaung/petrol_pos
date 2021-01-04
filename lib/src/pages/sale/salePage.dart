import 'package:OilPos/src/pages/sale/saleList.dart';
import 'package:OilPos/src/viewModels/sale/saleVIewModel.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'createSale.dart';

class SalePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("အရောင်းစာရင်း",
              style: Theme.of(context).textTheme.headline1),
        ),
        body: ChangeNotifierProvider(
            create: (context) => SaleViewModel(),
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical, child: SalesList())),
        floatingActionButton: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return CreateSale();
                  }));
                },
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                backgroundColor: Colors.green,
              ),
            )));
  }
}
