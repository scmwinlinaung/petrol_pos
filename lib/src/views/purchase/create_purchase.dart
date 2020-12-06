import 'package:OilPos/src/views/purchase/create_purchase_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';

class CreatePurchase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("အဝယ်စာရင်းအသစ်",
              style: Theme.of(context).textTheme.headline1),
        ),
        body: BlocProvider<PurchaseBloc>(
            create: (context) => PurchaseBloc(),
            child: SingleChildScrollView(child: CreatePurchaseForm())));
  }
}
