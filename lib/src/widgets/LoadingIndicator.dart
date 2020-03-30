import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
          ),
          widthFactor: 500,
          heightFactor: 500,
        ),
      );
}
