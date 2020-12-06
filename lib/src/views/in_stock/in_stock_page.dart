import 'package:OilPos/src/views/in_stock/bloc/bloc.dart';
import 'package:OilPos/src/views/in_stock/in_stock_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InStockPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ပစ္စည်းလက်ကျန်",
            style: Theme.of(context).textTheme.headline1),
      ),
      body: BlocProvider<InStockBloc>(
          create: (context) => InStockBloc()..add(GetInStockList()),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical, child: InStockList())),
    );
  }
}
