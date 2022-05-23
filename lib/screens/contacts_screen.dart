import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/contacts.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<Contacts>(context).getContacts().then((_) {
        setState(() {
          _isLoading = false;
        });
      }).catchError((error) {
        print(error.toString());
      });
    }
    setState(() {
      _isInit = false;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final contactsData = Provider.of<Contacts>(context);
    final contacts = contactsData.contacts;

    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(contacts[index].avatar),
            ),
            title: Text('${contacts[index].first_name} ${contacts[index].last_name}'),
            subtitle: Text(contacts[index].email),
          );
        },
      ),
    );
  }
}
