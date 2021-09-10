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
      child: ElevatedButton(
        child: Text(
          btnLabel,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        onPressed: press,
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          elevation: MaterialStateProperty.all(0),
        ),
      ),
    );
  }
}
