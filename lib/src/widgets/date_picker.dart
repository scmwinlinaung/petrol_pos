import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatelessWidget {
  static const _YEAR = 365;
  const DatePicker({Key key, this.selectedDate, this.onChanged})
      : super(key: key);
  final DateTime selectedDate;
  final ValueChanged<DateTime> onChanged;

  Future<Null> _selectDate(BuildContext context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    await Future.delayed(Duration(milliseconds: 100));
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now().subtract(Duration(days: _YEAR * 10)),
      lastDate: DateTime.now().add(Duration(days: _YEAR * 10)),
    );
    if (picked != null && picked != selectedDate) {
      onChanged(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.end, children: <Widget>[
      Expanded(
          child: InkWell(
              onTap: () => _selectDate(context),
              child: InputDecorator(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.today,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(left: 5.0),
                            child: Text(
                              DateFormat.yMMMd().format(selectedDate),
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 16),
                            )),
                      ]))))
    ]);
  }
}
