import 'package:flutter/material.dart';

class GoodTypeDropDown extends StatefulWidget {
  final String hint;
  final List<String> itemList;

  const GoodTypeDropDown({Key key, this.hint, this.itemList}) : super(key: key);
  @override
  _GoodTypeDropDownState createState() => _GoodTypeDropDownState();
}

class _GoodTypeDropDownState extends State<GoodTypeDropDown> {
  String dropdownValue = 'နိုင်ငံခြားဆီ';
  String get _hint => widget.hint;
  List<String> get _itemList => widget.itemList;

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
        icon: Icon(Icons.category),
        iconSize: 24,
        elevation: 1,
        style: TextStyle(color: Colors.deepPurple),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>["နိုင်ငံခြားဆီ", "ချက်ဆီ"]
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
