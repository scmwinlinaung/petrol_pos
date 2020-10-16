import 'package:OilPos/src/screens/purchase/purchase_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc.dart';

class PurchasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("အဝယ်စာရင်း", style: Theme.of(context).textTheme.headline1),
      ),
      body: BlocProvider<PurchaseBloc>(
          create: (context) => PurchaseBloc()..add(GetPurchasesList()),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical, child: PurchasesList())),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.green,
      ),
    );
  }
}
