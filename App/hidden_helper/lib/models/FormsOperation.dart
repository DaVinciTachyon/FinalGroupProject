import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hidden_helper/screens/add_screen.dart';
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
  static Future<int> sendToBackend(AbuseForm submittedForm) async {
    final storage = new FlutterSecureStorage();
    String token = await storage.read(key: NewNoteForm.TOKEN_KEY);
    print(token);
    var url = Uri.parse('https://db.sdart.ie/api/forms/');
    var response = await http.post(url,
        body: jsonEncode(submittedForm),
        headers: {'Content-Type': 'application/json', 'auth-token': token});
    print(jsonEncode(submittedForm));
    print(response.statusCode);
    print(response.reasonPhrase);
    return response.statusCode;
  }
}
