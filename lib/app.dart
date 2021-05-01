import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'document_repository.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Provider(
        create: (_) => DocumentRepository(),
        child: HomePage(),
      ),
    );
  }
}
