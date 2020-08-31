import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final Function function;
  final String labelText;

  const DefaultButton({Key key, this.function, this.labelText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Color(0xFF2B385B),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      onPressed: function,
      child: Text(
        labelText ?? '',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}
