import 'dart:async';
import 'package:OilPos/src/models/purchase/purchase.dart';
import 'package:OilPos/src/viewModels/purchase/purchaseViewModel.dart';
import 'package:OilPos/src/widgets/create_record_button.dart';
import 'package:OilPos/src/widgets/date_picker.dart';
import 'package:OilPos/src/widgets/goodtype_dropdown.dart';
import 'package:OilPos/src/widgets/payment_type_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  DateTime selectedDate = DateTime.now();

  bool _enabled = true;

  // PurchaseBloc _purchaseBloc;

  void _createPurchaseRecord() async {
    if (_companyNameCtrl.text != "" &&
        _companyPhoneCtrl.text != "" &&
        _goodTypeCtrl.text != "" &&
        _quantityCtrl.text != "" &&
        _rateFixedCtrl.text != "" &&
        _paymentTypeCtrl.text != "" &&
        _totalCtrl.text != "") {
      final purchaseViewModel =
          Provider.of<PurchaseViewModel>(context, listen: false);
      await purchaseViewModel.createPurchase(PurchaseModel(
          companyName: _companyNameCtrl.text,
          companyPhone: _companyPhoneCtrl.text,
          goodType: _goodTypeCtrl.text,
          quantity: int.parse(_quantityCtrl.text),
          rateFixed: int.parse(_rateFixedCtrl.text),
          paymentType: _paymentTypeCtrl.text,
          total: int.parse(_totalCtrl.text),
          createdAt: selectedDate.toString()));
      // Disable GestureDetector's 'onTap' property.
      setState(() => _enabled = false);
      await _showCompleteDialog();
    } else {
      setState(() => _enabled = false);
      await _showCancelDialog();
    }

    // Rest of your code.
  }

  @override
  void initState() {
    _companyNameCtrl.clear();
    _companyPhoneCtrl.clear();
    _goodTypeCtrl.clear();
    _quantityCtrl.clear();
    _rateFixedCtrl.clear();
    _paymentTypeCtrl.clear();
    _totalCtrl.clear();
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

  Future<void> _showCompleteDialog() async {
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

  Future<void> _showCancelDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('စာရင်းသွင်းခြင်း'),
          titleTextStyle: Theme.of(context).textTheme.headline2,
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[Text("အချက်အလက်အပြည့်အစုံကိုထည့်သွင်းပေးပါ")],
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
    return Consumer<PurchaseViewModel>(
        builder: (context, purchaseViewModel, child) {
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
                                autocorrect: false,
                                keyboardType: TextInputType.number,
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
                                autocorrect: false,
                                keyboardType: TextInputType.number,
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
                                    Icons.money,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  labelText: "စုစုပေါင်း",
                                  labelStyle:
                                      Theme.of(context).textTheme.bodyText1,
                                ),
                                style: Theme.of(context).textTheme.bodyText2,
                                autocorrect: false,
                                keyboardType: TextInputType.number,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              DatePicker(
                                  selectedDate: selectedDate,
                                  onChanged: ((DateTime date) {
                                    if (date != null) {
                                      setState(() {
                                        selectedDate = date;
                                      });
                                    }
                                  })),
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
                                          return _createPurchaseRecord();
                                        } else
                                          return null;
                                      },
                                    )
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
