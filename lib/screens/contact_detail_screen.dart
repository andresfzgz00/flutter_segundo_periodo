import 'package:flutter/material.dart';
import '../providers/contact.dart';

class ContactDetailScreen extends StatelessWidget {

  static const routeName = "/contact-detail";

  @override
  Widget build(BuildContext context) {
    final contact = ModalRoute.of(context)?.settings.arguments as Contact;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add Contact"),
        ),
        body: Column(
          children: [
            Hero(
              tag: DateTime.now().toString(),
              child: Image.network(
                contact.avatar,
                fit: BoxFit.cover,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(
                  height: 10,
                ),
                Text(
                  contact.first_name,
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  contact.last_name,
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  contact.email,
                  style: const TextStyle(fontSize: 20),
                ),
              ]),
            ),
          ],
        ));
  }
}
