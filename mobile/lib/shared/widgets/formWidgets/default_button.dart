import 'package:flutter/material.dart';
import 'package:mobile/locale/constants/theme_constants.dart';

class DefaultButton extends StatelessWidget {
  final String btnLabel;
  final Function() press;
  const DefaultButton({
    required this.btnLabel,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: FlatButton(
        color: kPrimaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Text(
          btnLabel,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        onPressed: press,
      ),
    );
  }
}
