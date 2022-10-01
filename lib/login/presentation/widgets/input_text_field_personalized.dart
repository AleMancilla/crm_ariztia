import 'package:ariztia_crm/core/widgets/text_field_ariztia.dart';
import 'package:flutter/material.dart';

class InputTextFieldPersonalized extends StatelessWidget {
  const InputTextFieldPersonalized(
    this.title,
    this.controller, {
    Key? key,
  }) : super(key: key);
  final String title;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w900,
                fontSize: 17),
          ),
          TextFieldAriztia(controller),
        ],
      ),
    );
  }
}
