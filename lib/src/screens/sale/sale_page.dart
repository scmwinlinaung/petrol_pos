import 'package:OilPos/src/screens/sale/sale_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc.dart';
import 'create_sale.dart';

class SalePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:
            Text("အရောင်းစာရင်း", style: Theme.of(context).textTheme.headline1),
      ),
      body: BlocProvider<SaleBloc>(
          create: (context) => SaleBloc()..add(GetSalesList(page: 0)),
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical, child: SalesList())),
      floatingActionButton: FloatingActionButton(
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
    );
  }
}
