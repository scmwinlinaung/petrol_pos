import 'package:OilPos/src/views/sale/sale_list.dart';
import 'package:OilPos/src/views/sale_debt/sale_debt_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc.dart';

class SaleDebtPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("အရောင်းကြွေးကျန်စာရင်း",
            style: Theme.of(context).textTheme.headline1),
      ),
      body: BlocProvider<SaleDebtBloc>(
          create: (context) => SaleDebtBloc()..add(GetSalesDebtList(page: 0)),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical, child: SalesDebtList())),
    );
  }
}
