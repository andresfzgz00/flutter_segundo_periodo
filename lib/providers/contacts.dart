import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import './contact.dart';

class Contacts with ChangeNotifier {
  List<Contact> _contacts = [];

  List<Contact> get contacts {
    return [..._contacts];
  }

  Future <void> getContacts() async {
    final url = Uri.parse('https://reqres.in/api/users');
    final response = await http.get(url);
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final List rawList = data["data"];

    _contacts = rawList
        .map((e) => Contact(
            id: e["id"],
            email: e["email"],
            first_name: e["first_name"],
            last_name: e["last_name"],
            avatar: e["avatar"]))
        .toList();
    notifyListeners();
  }

  addContact(Contact contact) {
    _contacts.add(contact);
    notifyListeners();
  }
}
