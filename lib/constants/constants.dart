import 'package:flutter/cupertino.dart';

class FormController {
  GlobalKey formKey = GlobalKey();
  TextEditingController text = TextEditingController();
  String textField = '';
  RegExp regExp = RegExp(r'/^[0-1()|&]+$/');

  final ValueNotifier<bool> buttonVisible = ValueNotifier(false);
}
