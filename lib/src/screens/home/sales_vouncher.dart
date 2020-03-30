import 'package:OilPos/src/screens/home/print_vouncher.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class SalesVouncher extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SalesVouncherState();
  }
}

class _SalesVouncherState extends State<SalesVouncher> {
  DateTime _dateTime = DateTime.now();
  String _formatDate;
  final _formKey = GlobalKey<FormState>();
  TextEditingController customerTextFieldCtrl = new TextEditingController();
  TextEditingController quantityTextFieldCtrl = new TextEditingController();
  TextEditingController priceTextFieldCtrl = new TextEditingController();
  TextEditingController debtTextFieldCtrl = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'အချက်အလက်ထည့်ရန်',
          style: Theme.of(context).textTheme.title,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
        iconTheme: new IconThemeData(color: Colors.white),
      ),
      body: _buildForm(),
    );
  }

  Widget _buildForm() {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 20,
        height: MediaQuery.of(context).size.height - 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Form(
            key: _formKey,
            child: Container(
                padding: EdgeInsets.fromLTRB(20, 100, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    _buildTable(),
                    SizedBox(height: 150),
                    _buildSubmitButton()
                  ],
                  //  _buildTable()
                ))),
      ),
    );
  }

  Widget _buildTable() {
    return Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
        children: [
          TableRow(children: [
            Container(
                height: 60,
                child: Text(
                  'ဖောက်သည်အမည်',
                  style: Theme.of(context).textTheme.body1,
                )),
            Container(
              height: 60,
              child: _buildCustomerField(),
            )
          ]),
          TableRow(children: [
            Container(
              height: 60,
              child: Text(
                'ရက်စွဲ',
                style: Theme.of(context).textTheme.body1,
              ),
            ),
            Container(
              height: 60,
              child: _buildDateField(),
            )
          ]),
          TableRow(children: [
            Container(
              height: 60,
              child: Text(
                'လီတာ',
                style: Theme.of(context).textTheme.body1,
              ),
            ),
            Container(
              height: 60,
              child: _buildQuantityField(),
            )
          ]),
          TableRow(children: [
            Container(
              height: 60,
              child: Text(
                'ဈေးနှုန်း',
                style: Theme.of(context).textTheme.body1,
              ),
            ),
            Container(
              height: 60,
              child: _buildPriceField(),
            ),
          ]),
          TableRow(children: [
            Container(
              height: 60,
              child: Text(
                'ရှင်းရန်ကျန်ငွေ',
                style: Theme.of(context).textTheme.body1,
              ),
            ),
            Container(
              height: 60,
              child: _buildDebtField(),
            ),
          ]),
        ]);
  }

  Widget _buildCustomerField() {
    return TextFormField(
      controller: customerTextFieldCtrl,
      textAlign: TextAlign.left,
    );
  }

  Widget _buildDateField() {
    if (_dateTime != null)
      _formatDate = new DateFormat.yMMMd().format(_dateTime);
    print(_dateTime.toString());
    return MaterialButton(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Icon(
              FontAwesomeIcons.calendar,
              color: Colors.lightBlue,
              size: 20,
            ),
            SizedBox(width: 5),
            Expanded(
                child: Text(
              _dateTime != null ? _formatDate.toString() : 'ရက်ဆွဲထည့်ပါ',
              style: Theme.of(context).textTheme.body1,
            ))
          ],
        ),
        onPressed: () {
          showDatePicker(
                  context: context,
                  initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2100))
              .then((date) {
            setState(() {
              _dateTime = date;
            });
          });
        });
  }

  Widget _buildPriceField() {
    return TextFormField(
      controller: priceTextFieldCtrl,
      keyboardType: TextInputType.numberWithOptions(),
    );
  }

  Widget _buildQuantityField() {
    return TextFormField(
      controller: quantityTextFieldCtrl,
      keyboardType: TextInputType.numberWithOptions(),
    );
  }

  Widget _buildDebtField() {
    return TextFormField(
      controller: debtTextFieldCtrl,
      keyboardType: TextInputType.numberWithOptions(),
    );
  }

  Widget _buildSubmitButton() {
    return MaterialButton(
      height: 50,
      minWidth: 350,
      color: Colors.lightBlue,
      child: Text(
        'ဆက်လုပ်မည်',
        style: Theme.of(context).textTheme.title,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PrintVouncher(
                    customerName: customerTextFieldCtrl.text,
                    date: _formatDate,
                    quantity: quantityTextFieldCtrl.text,
                    price: priceTextFieldCtrl.text,
                    debt: debtTextFieldCtrl.text,
                  )),
        );
      },
      // child: Text(
      //   'ဆက်လုပ်မည်',
      //   style: Theme.of(context).textTheme.title,
      //   ),
    );
  }
}
