import 'package:flutter/material.dart';
import 'package:saverecipe/constant.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SubmitButton({Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        side: BorderSide(color: kBorderColor),
      ),
      child: Text(
        'Submit',
        style: TextStyle(color: kWhite, fontSize: 18),
      ),
      color: Theme.of(context).buttonColor,
      onPressed: onPressed,
    );
  }
}
