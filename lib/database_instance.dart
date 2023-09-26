import 'dart:io';

import 'package:buku_kas_nusantara/flow_model.dart';
import 'package:buku_kas_nusantara/homePage.dart';
import 'package:buku_kas_nusantara/loginPage.dart';
import 'package:buku_kas_nusantara/user_model.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseInstance {
  final String _databaseName = "databaseBKN.db";
  final int _databaseVersion = 1;

  // Database User
  final String _tableUser = "user";
  final String _columnIdUser = "id";
  final String _columnUsername = "username";
  final String _columnPassword = "password";
  final String _columnName = "name";
  final String _columnStatus = "is_logged_in";
  final String _columnCreatedAtUser = "created_at";
  final String _columnUpdatedAtUser = "updated_at";

  // Database Bank
  final String _tableBank = "user_Bank";
  final String _columnIdBank = "id";
  final String _columnIdUserBank = "id_user";
  final String _columnTypeBank = "type";
  final String _columnDateBank = "date";
  final String _columnTotalBank = "total";
  final String _columnDescriptionBank = "description";
  final String _columnCreatedAtBank = "created_at";
  final String _columnUpdatedAtBank = "updated_at";

  Database _database;
  // Cek Apakah Database Sudah Ada
  Future<Database> get database async {
    if (_database != null) return _database;
    // Create Database
    _database = await _initDatabase();
    return _database;
  }

  // Mencari Database Di Directory
  Future _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _databaseName);
    try {
      _database = await openDatabase(path,
          version: _databaseVersion, onCreate: _onCreate);
      return _database;
    } catch (e) {
      print('Error saat membuka database: $e');
      return null;
    }
  }

  // Membuat Tabel
  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $_tableUser (
      $_columnIdUser INTEGER PRIMARY KEY, 
      $_columnUsername TEXT, 
      $_columnPassword TEXT, 
      $_columnName TEXT, 
      $_columnStatus TEXT, 
      $_columnCreatedAtUser TEXT, 
      $_columnUpdatedAtUser TEXT)
      ''');

    await db.execute('''
    CREATE TABLE $_tableBank (
      $_columnIdBank INTEGER PRIMARY KEY, 
      $_columnIdUserBank INTEGER, 
      $_columnTypeBank TEXT, 
      $_columnDateBank TEXT, 
      $_columnTotalBank INTEGER, 
      $_columnDescriptionBank TEXT, 
      $_columnCreatedAtBank TEXT, 
      $_columnUpdatedAtBank TEXT,
      FOREIGN KEY ($_columnIdUserBank) REFERENCES $_tableUser ($_columnIdUser))
      ''');
  }

  Future<int> createUser(UserModel user) async {
    final db = await database;
    return await db.insert(_tableUser, user.toJson());
  }

  Future<UserModel> getUserByUsername(String username) async {
    final db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      _tableUser,
      where: '$_columnUsername = ?',
      whereArgs: [username],
    );
    if (maps.isEmpty) return null;
    return UserModel.fromJson(maps.first);
  }

  Future<UserModel> getUserById(int id) async {
    final db = await database;
    List<Map<String, dynamic>> maps = await db.query(
      _tableUser,
      where: '$_columnIdUser = ?',
      whereArgs: [id],
    );
    if (maps.isEmpty) return null;
    return UserModel.fromJson(maps.first);
  }

  Future<void> login(
      String username, String password, BuildContext context) async {
    UserModel user = await DatabaseInstance().getUserByUsername(username);

    if (user != null && user.password == password) {
      // Login berhasil
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage(
                  id_user: user.id,
                )),
      );
    } else {
      // Gagal login
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Username atau password salah.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> register(String username, String password, String name,
      BuildContext context) async {
    UserModel user = UserModel(
      username: username,
      password: password,
      name: name,
      createdAt: DateTime.now().toString(),
      updatedAt: DateTime.now().toString(),
    );
    int result = await DatabaseInstance().createUser(user);
    if (result > 0) {
      // Registrasi berhasil
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } else {
      // Gagal registrasi
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Gagal registrasi. Silakan coba lagi.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> changePassword(
      int id, String password, String newPassword, BuildContext context) async {
    UserModel user = await DatabaseInstance().getUserById(id);
    if (user != null && user.password == password) {
      // Password lama sesuai, update password di objek user
      user.password = newPassword;
      user.createdAt = DateTime.now().toString();

      // Lakukan UPDATE ke database
      final db = await DatabaseInstance().database;
      await db.update(
        DatabaseInstance()._tableUser, // Nama tabel yang sesuai
        user.toJson(), // Data yang diperbarui
        where: '${DatabaseInstance()._columnIdUser} = ?', // Kriteria WHERE
        whereArgs: [id], // Parameter WHERE
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } else {
      // Password lama tidak sesuai
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Password lama tidak sesuai.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<int> createBank(FlowModel flow) async {
    final db = await database;
    return await db.insert(_tableBank, flow.toJson());
  }

  Future<void> addIncome(int id_user, String date, int total,
      String description, BuildContext context) async {
    FlowModel flow = FlowModel(
      id_user: id_user,
      type: 'income',
      date: date,
      total: total,
      description: description,
      createdAt: DateTime.now().toString(),
      updatedAt: DateTime.now().toString(),
    );
    int result = await DatabaseInstance().createBank(flow);
    if (result > 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage(id_user: id_user)),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Gagal menambahkan. Silakan coba lagi.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> addOutcome(int id_user, String date, int total,
      String description, BuildContext context) async {
    FlowModel flow = FlowModel(
      id_user: id_user,
      type: 'outcome',
      date: date,
      total: total,
      description: description,
      createdAt: DateTime.now().toString(),
      updatedAt: DateTime.now().toString(),
    );
    int result = await DatabaseInstance().createBank(flow);
    if (result > 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage(id_user: id_user)),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Gagal menambahkan. Silakan coba lagi.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<List<FlowModel>> all(int id_user) async {
    final db = await database;
    if (_database != null) {
      final data = await db.query(
            _tableBank,
            where: '$_columnIdUserBank = ?',
            whereArgs: [id_user],
          ) ??
          [];
      List<FlowModel> result = data.map((e) => FlowModel.fromJson(e)).toList();

      // Memeriksa dan mengganti nilai null jika diperlukan
      for (var flow in result) {
        if (flow.total == null) {
          flow.total = 0; // Ganti dengan nilai default atau nilai yang sesuai
        }
        if (flow.description == null) {
          flow.description =
              ""; // Ganti dengan nilai default atau nilai yang sesuai
        }
      }
      print(result);
      return result;
    } else {
      print('Database belum terbuka');
      return [];
    }
  }

  Future<int> totalIncome({int id_user}) async {
    final db = await database;
    int income = 0; // Inisialisasi dengan nilai 0

    if (_database != null) {
      final data = await db.query(
            _tableBank,
            where: '$_columnIdUserBank = ? AND $_columnTypeBank = ?',
            whereArgs: [id_user, "income"],
          ) ??
          [];
      List<FlowModel> result = data.map((e) => FlowModel.fromJson(e)).toList();

      // Menjumlahkan total pendapatan
      for (var flow in result) {
        income += flow.total;
      }

      return income;
    } else {
      return income; // Return 0 jika database belum terbuka
    }
  }

  Future<int> totalOutcome({int id_user}) async {
    final db = await database;
    int outcome = 0; // Inisialisasi dengan nilai 0

    if (_database != null) {
      final data = await db.query(
            _tableBank,
            where: '$_columnIdUserBank = ? AND $_columnTypeBank = ?',
            whereArgs: [id_user, "outcome"],
          ) ??
          [];
      List<FlowModel> result = data.map((e) => FlowModel.fromJson(e)).toList();

      // Menjumlahkan total pendapatan
      for (var flow in result) {
        outcome += flow.total;
      }

      return outcome;
    } else {
      return outcome; // Return 0 jika database belum terbuka
    }
  }
  Future<String> getName({int id_user}) async {
  UserModel user = await DatabaseInstance().getUserById(id_user);
  return user.name;
}
}
