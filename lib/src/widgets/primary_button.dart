import 'package:flutter/material.dart';

class ButtonPrimary extends StatelessWidget {
  final VoidCallback _onPressed;
  final String title;
  final Color color;

  ButtonPrimary({Key key, VoidCallback onPressed, this.title, this.color})
      : _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        elevation: 1,
        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        color: this.color,
        onPressed: _onPressed,
        child: Text(this.title,
            style: TextStyle(fontSize: 16, color: Colors.white)));
  }
}
