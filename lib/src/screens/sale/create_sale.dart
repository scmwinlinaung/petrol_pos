import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';
import 'create_sale_form.dart';

class CreateSale extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("အရောင်းစာရင်းအသစ်",
              style: Theme.of(context).textTheme.headline1),
        ),
        body: BlocProvider<SaleBloc>(
            create: (context) => SaleBloc(),
            child: SingleChildScrollView(child: CreateSaleForm())));
  }
}
