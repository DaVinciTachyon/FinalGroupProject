import 'dart:convert';

import 'package:flutter/material.dart';
import 'AbuseForm.dart';

class FormsOperation extends ChangeNotifier {
  List<AbuseForm> _forms = new List<AbuseForm>();

  List<AbuseForm> get getForms {
    return _forms;
  }


  void addNewForm(AbuseForm submittedForm) {
    _forms.add(submittedForm);
    notifyListeners();
  }
}

class FormHttpOperations {
  static void sendToBackend(AbuseForm submittedForm) {
    print(jsonEncode(submittedForm));
  }
}
