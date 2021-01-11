import 'dart:async';

import 'package:flutter/material.dart';

class ProgressButton extends StatefulWidget {
  final Function _onPressed;
  final String title;
  final Color color;

  ProgressButton({Key key, Function onPressed, this.title, this.color})
      : _onPressed = onPressed,
        super(key: key);

  @override
  _ProgressButtonState createState() => _ProgressButtonState();
}

class _ProgressButtonState extends State<ProgressButton> {
  String get title => widget.title;
  Color get color => widget.color;
  Function get onPressed => widget._onPressed;

  int _state = 0;

  @override
  Widget build(BuildContext context) {
    return new MaterialButton(
      child: setUpButtonChild(),
      onPressed: () {
        onPressed();
        setState(() {
          if (_state == 0) {
            animateButton();
          }
        });
      },
      elevation: 4.0,
      minWidth: double.infinity,
      height: 48.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.grey)),
      color: color,
    );
  }

  Widget setUpButtonChild() {
    if (color == Colors.grey) {
      return Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.center,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
          Align(
              alignment: AlignmentDirectional.centerEnd,
              child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ))),
        ],
      );
    } else {
      return new Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      );
    }
  }

  void animateButton() {
    setState(() {
      _state = 1;
    });

    Timer(Duration(milliseconds: 3300), () {
      setState(() {
        _state = 2;
      });
    });
  }
}
