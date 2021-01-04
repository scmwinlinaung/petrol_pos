import 'package:OilPos/src/viewModels/inStock/inStockViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'inStockList.dart';

class InStockPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ပစ္စည်းလက်ကျန်",
            style: Theme.of(context).textTheme.headline1),
      ),
      body: ChangeNotifierProvider(
          create: (context) => InStockViewModel(),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical, child: InStockList())),
    );
  }
}
