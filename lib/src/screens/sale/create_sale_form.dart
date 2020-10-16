import 'package:OilPos/src/widgets/GoodTypeDropDown.dart';
import 'package:OilPos/src/widgets/PaymentTypeDropDown.dart';
import 'package:OilPos/src/widgets/PrimaryButton.dart';
import 'package:flutter/material.dart';

class CreateSaleForm extends StatefulWidget {
  @override
  _CreateSaleFormState createState() => _CreateSaleFormState();
}

class _CreateSaleFormState extends State<CreateSaleForm> {
  TextEditingController _customerNameCtrl = new TextEditingController();
  TextEditingController _customerPhoneCtrl = new TextEditingController();
  TextEditingController _goodTypeCtrl = new TextEditingController();
  TextEditingController _quantityCtrl = new TextEditingController();
  TextEditingController _rateFixedCtrl = new TextEditingController();
  TextEditingController _paymentTypeCtrl = new TextEditingController();
  TextEditingController _totalCtrl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 35),
        child: Card(
            elevation: 1,
            color: Colors.grey[100],
            child: Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Form(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical:20
                          ),
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _customerNameCtrl,
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.supervised_user_circle,
                                  color: Theme.of(context).primaryColor,
                                ),
                                labelText: "အမည်",
                                labelStyle:
                                    Theme.of(context).textTheme.bodyText1,
                              ),
                              style: Theme.of(context).textTheme.headline4,
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
                              controller: _customerPhoneCtrl,
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.phone_iphone,
                                  color: Theme.of(context).primaryColor,
                                ),
                                labelText: "ဖုန်းနံပါတ်",
                                labelStyle:
                                    Theme.of(context).textTheme.bodyText1,
                              ),
                              style: Theme.of(context).textTheme.headline4,
                              keyboardType: TextInputType.phone,
                              autovalidate: true,
                              autocorrect: false,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            GoodTypeDropDown(hint: "အမျိုးအစား", itemList: ["နိုင်ငံခြားဆီ","ချက်ဆီ"],),
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
                              style: Theme.of(context).textTheme.headline4,
                              obscureText: true,
                              autovalidate: true,
                              autocorrect: false,
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
                                labelText: "နှုန်း",
                                labelStyle:
                                    Theme.of(context).textTheme.bodyText1,
                              ),
                              style: Theme.of(context).textTheme.headline4,
                              obscureText: true,
                              autovalidate: true,
                              autocorrect: false,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            PaymentTypeDropDown(hint: "ငွေပေးချေမည့်ပုံစံ",),
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
                                labelText: "စုစုပေါင်း",
                                labelStyle:
                                    Theme.of(context).textTheme.bodyText1,
                              ),
                              style: Theme.of(context).textTheme.headline4,
                              obscureText: true,
                              autovalidate: true,
                              autocorrect: false,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 40),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  ButtonPrimary(
                                    color: Theme.of(context).primaryColor,
                                    onPressed: () {},
                                    title: "အရောင်းစာရင်း အသစ်ထည့်မယ်",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ))));
  }
}
