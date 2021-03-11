import 'package:flutter/material.dart';
import 'AbuseForm.dart';

class FormsOperation extends ChangeNotifier{
  List<AbuseForm> _forms = new List<AbuseForm>();

  List<AbuseForm> get getForms {
    return _forms;
  }

  void addNewForm(String type, String location){
      AbuseForm form = AbuseForm();
      _forms.add(form);
      notifyListeners();
    }
  }
