import 'dart:async';

import 'package:OilPos/src/screens/purchase/bloc/bloc.dart';
import 'package:OilPos/src/screens/purchase/bloc/purchase_event.dart';
import 'package:OilPos/src/screens/purchase/model/Purchase.dart';
import 'package:OilPos/src/screens/sale/bloc/bloc.dart';
import 'package:OilPos/src/screens/sale/bloc/sale_bloc.dart';
import 'package:OilPos/src/widgets/CreateRecordButton.dart';
import 'package:OilPos/src/widgets/GoodTypeDropDown.dart';
import 'package:OilPos/src/widgets/PaymentTypeDropDown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePurchaseForm extends StatefulWidget {
  @override
  _CreatePurchaseFormState createState() => _CreatePurchaseFormState();
}

class _CreatePurchaseFormState extends State<CreatePurchaseForm> {
  TextEditingController _companyNameCtrl = new TextEditingController();
  TextEditingController _companyPhoneCtrl = new TextEditingController();
  TextEditingController _goodTypeCtrl = new TextEditingController();
  TextEditingController _quantityCtrl = new TextEditingController();
  TextEditingController _rateFixedCtrl = new TextEditingController();
  TextEditingController _paymentTypeCtrl = new TextEditingController();
  TextEditingController _totalCtrl = new TextEditingController();

  bool _enabled = true;

  PurchaseBloc _purchaseBloc;

  void _createSaleRecord() async {
    _purchaseBloc.add(CreatePurchaseButtonPressed(
        purchase: Purchase(
            companyName: _companyNameCtrl.text,
            companyPhone: _companyPhoneCtrl.text,
            goodType: _goodTypeCtrl.text,
            quantity: int.parse(_quantityCtrl.text),
            rateFixed: int.parse(_rateFixedCtrl.text),
            paymentType: _paymentTypeCtrl.text,
            total: int.parse(_totalCtrl.text))));
    // Disable GestureDetector's 'onTap' property.
    setState(() => _enabled = false);
    await _showMyDialog();

    // Rest of your code.
  }

  @override
  void initState() {
    _purchaseBloc = BlocProvider.of(context);
    super.initState();
  }

  @override
  void dispose() {
    _companyNameCtrl.dispose();
    _companyPhoneCtrl.dispose();
    _goodTypeCtrl.dispose();
    _quantityCtrl.dispose();
    _rateFixedCtrl.dispose();
    _paymentTypeCtrl.dispose();
    _totalCtrl.dispose();

    super.dispose();
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('စာရင်းသွင်းခြင်း'),
          titleTextStyle: Theme.of(context).textTheme.headline2,
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[Text("အဝယ်စာရင်း အသစ်ထည့်ပြီးပါပြီ")],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() => _enabled = true);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PurchaseBloc, PurchaseState>(builder: (context, state) {
      return Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 35),
          child: Card(
              elevation: 1,
              color: Colors.grey[100],
              child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Form(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _companyNameCtrl,
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.supervised_user_circle,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  labelText: "အမည်",
                                  labelStyle:
                                      Theme.of(context).textTheme.bodyText1,
                                ),
                                style: Theme.of(context).textTheme.bodyText2,
                                keyboardType: TextInputType.name,
                                autovalidate: true,
                                autocorrect: false,
                                // validator: (_) {
                                //   return !state.isPhoneNumValid
                                //       ? 'ဖုန်းနံပါတ်မှားနေသည်'
                                //       : null;
                                // },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: _companyPhoneCtrl,
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.phone_iphone,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  labelText: "ဖုန်းနံပါတ်",
                                  labelStyle:
                                      Theme.of(context).textTheme.bodyText1,
                                ),
                                style: Theme.of(context).textTheme.bodyText2,
                                keyboardType: TextInputType.phone,
                                autovalidate: true,
                                autocorrect: false,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GoodTypeDropDown(
                                hint: "အမျိုးအစား",
                                itemList: ["နိုင်ငံခြားဆီ", "ချက်ဆီ"],
                                goodType: _goodTypeCtrl,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: _quantityCtrl,
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.category,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  labelText: "အရေအတွက်",
                                  labelStyle:
                                      Theme.of(context).textTheme.bodyText1,
                                ),
                                style: Theme.of(context).textTheme.bodyText2,
                                autovalidate: true,
                                autocorrect: false,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: _rateFixedCtrl,
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.category,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  labelText: "နှုန်း",
                                  labelStyle:
                                      Theme.of(context).textTheme.bodyText1,
                                ),
                                style: Theme.of(context).textTheme.bodyText2,
                                autovalidate: true,
                                autocorrect: false,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              PaymentTypeDropDown(
                                hint: "ငွေပေးချေမည့်ပုံစံ",
                                paymentType: _paymentTypeCtrl,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: _totalCtrl,
                                decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.category,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  labelText: "စုစုပေါင်း",
                                  labelStyle:
                                      Theme.of(context).textTheme.bodyText1,
                                ),
                                style: Theme.of(context).textTheme.bodyText2,
                                autovalidate: true,
                                autocorrect: false,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 40),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    CreateRecordButton(
                                      color: _enabled
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey,
                                      title: "အဝယ်စာရင်းအသစ် ထည့်မယ်",
                                      onPressed: () {
                                        if (_enabled) {
                                          return _createSaleRecord();
                                        } else
                                          return null;
                                      },
                                    )
                                    // ButtonPrimary(
                                    //   color: _enabled
                                    //       ? Theme.of(context).primaryColor
                                    //       : Colors.grey,
                                    //   onPressed: () {
                                    //     if (_enabled) {
                                    //       return _createSaleRecord(
                                    //           state.goodType,
                                    //           state.paymentType);
                                    //     } else
                                    //       return null;
                                    //   },
                                    //   title: "အရောင်းစာရင်း အသစ်ထည့်မယ်",
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ))));
    });
  }
}
