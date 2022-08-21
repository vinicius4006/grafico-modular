import 'package:flutter/material.dart';
import 'package:graficos_app/constants/constants.dart';

class TextForm extends StatelessWidget {
  const TextForm(
      {Key? key,
      required this.textInputType,
      required this.textController,
      required this.formController})
      : super(key: key);
  final TextInputType textInputType;
  final TextEditingController textController;
  final FormController formController;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle, border: Border.all(width: 2)),
      child: TextFormField(
        controller: textController,
        keyboardType: textInputType,
        style: const TextStyle(fontSize: 15),
        onFieldSubmitted: (value) {
          formController.textField = value;
          if (value.isEmpty) {
            formController.buttonVisible.value = false;
          } else {
            formController.buttonVisible.value = true;
          }
        },
      ),
    );
  }
}
