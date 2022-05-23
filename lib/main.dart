import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/contacts.dart';
import './screens/contacts_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Contacts())
    ],
    child: MaterialApp(
      title: "Contacts",
      theme: ThemeData(
        primarySwatch: Colors.amber
      ),
      home: ContactsScreen(),
    ),
    
    ); 

  }
}