import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/contacts.dart';
import '../providers/contact.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({Key? key}) : super(key: key);

  static const routeName = "/add-contact";

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final Map<String, String> _contactData = {
    "email": "",
    "first_name": "",
    "last_name": "",
    "avatar": ""
  };

  _save() {
    final contacts = Provider.of<Contacts>(context);
    contacts.addContact(Contact(
        id: DateTime.now().toString(),
        email: _contactData["email"]!,
        first_name: _contactData["first_name"]!,
        last_name: _contactData["last_name"]!,
        avatar: _contactData["avatar"]!));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Contact"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: DateTime.now().toString(),
                child: Image.network(
                  _contactData["avatar"] == ""
                      ? "https://uning.es/wp-content/uploads/2016/08/ef3-placeholder-image.jpg"
                      : _contactData["avatar"]!,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'E-mail'),
                      onSaved: (value) {
                        _contactData["email"] = value!;
                      },
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'First Name'),
                      onSaved: (value) {
                        _contactData["first_name"] = value!;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Last Name'),
                      onSaved: (value) {
                        _contactData["last_name"] = value!;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Avatar'),
                      onSaved: (value) {
                        setState(() {
                          _contactData["avatar"] = value!;
                        });
                      },
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _save,
        child: const Icon(Icons.save),
      ),
    );
  }
}
