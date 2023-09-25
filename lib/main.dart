import 'package:buku_kas_nusantara/database_instance.dart';
import 'package:buku_kas_nusantara/loginPage.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Pastikan Flutter sudah terinisialisasi

  // Inisialisasi database
  await DatabaseInstance();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}