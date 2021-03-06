import 'package:flutter/material.dart';

class PaymentTypeDropDown extends StatefulWidget {
  final String hint;
  final List<String> itemList;
  final TextEditingController paymentType;

  const PaymentTypeDropDown(
      {Key key, this.hint, this.itemList, this.paymentType})
      : super(key: key);
  @override
  _PaymentTypeDropDownState createState() => _PaymentTypeDropDownState();
}

class _PaymentTypeDropDownState extends State<PaymentTypeDropDown> {
  String dropdownValue = 'အကြွေး';
  String get _hint => widget.hint;
  List<String> get _itemList => widget.itemList;

  TextEditingController get _paymentType => widget.paymentType;

  set _paymentType(TextEditingController paymentType) {
    this._paymentType = paymentType;
  }

  @override
  void initState() {
    _paymentType.text = dropdownValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.78,
      alignment: AlignmentDirectional.centerEnd,
      child: DropdownButton<String>(
        hint: Text(_hint, style: Theme.of(context).textTheme.bodyText1),
        value: dropdownValue,
        itemHeight: 80,
        isExpanded: true,
        icon: Icon(Icons.payment),
        iconSize: 24,
        elevation: 1,
        style: TextStyle(color: Colors.deepPurple),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
          _paymentType.text = newValue;
        },
        items: <String>["အကြွေး", "လက်ငင်း"]
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
