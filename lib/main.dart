import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Authentication/AuthService.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:isro_quiz/Quiz/save_file_mobile.dart' ;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const _MainApp());
}

class _MainApp extends StatelessWidget {
  const _MainApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ISRO Quiz',
        home: AuthService().handleAuthState(),
      );

  }
}