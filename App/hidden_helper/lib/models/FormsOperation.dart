import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'AbuseForm.dart';

class FormsOperation extends ChangeNotifier {
  List<AbuseForm> _forms = [];

  List<AbuseForm> get getForms {
    return _forms;
  }


  void addNewForm(AbuseForm submittedForm) {
    _forms.add(submittedForm);
    notifyListeners();
  }
}

class FormHttpOperations {
  static Future<void> sendToBackend(AbuseForm submittedForm) async {
    var url = Uri.parse('http://localhost:8082/api/forms/');
    var response = await http.post(url, body: jsonEncode(submittedForm));
    print(jsonEncode(submittedForm));
    print(response);
  }
}
