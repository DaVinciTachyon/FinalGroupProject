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
    var url = Uri.parse('http://192.168.0.59:8082/api/forms/');
    var response = await http.post(url, body: jsonEncode(submittedForm), headers: {'Content-Type': 'application/json'});
    // print(jsonEncode(submittedForm));
    // print(response);
  }
}
