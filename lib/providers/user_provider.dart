import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _name = 'Nom de l’utilisateur';
  String get name => _name;

  void updateName(String newName) {
    _name = newName;
    notifyListeners();
  }
}
