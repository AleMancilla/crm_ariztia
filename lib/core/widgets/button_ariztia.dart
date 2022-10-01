import 'package:flutter/material.dart';

class ButtonAriztia extends StatelessWidget {
  const ButtonAriztia({Key? key, required this.text, required this.onpress})
      : super(key: key);
  final String text;
  final Function onpress;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: () => onpress(),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).primaryColor,
          ),
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Center(
            child: Text(
              text,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
            ),
          ),
        ),
      ),
    );
  }
}
