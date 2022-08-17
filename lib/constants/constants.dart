import 'package:flutter/cupertino.dart';

class FormController {
  GlobalKey formKey = GlobalKey();
  TextEditingController text = TextEditingController();
  String textField = '';
  RegExp regExp = RegExp(r'/^[0-1()|&]+$/');
}
