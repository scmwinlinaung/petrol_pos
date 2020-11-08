import 'package:OilPos/src/screens/purchase_debt/purchase_debt_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';

class PurchaseDebtPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("အဝယ်ကြွေးကျန်စာရင်း",
            style: Theme.of(context).textTheme.headline1),
      ),
      body: BlocProvider<PurchaseDebtBloc>(
          create: (context) =>
              PurchaseDebtBloc()..add(GetPurchasesDebtList(page: 0)),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical, child: PurchasesDebtList())),
    );
  }
}
