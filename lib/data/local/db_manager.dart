import 'package:base_widget/data/local/db_constant.dart';
import 'package:base_widget/data/local/model/user.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DBManager {
  static DBManager? _dbManager;
  static Database? _database;

  DBManager._instance();

  factory DBManager() {
    return _dbManager ??= DBManager._instance();
  }

  Future<Database> get database async {
    return _database ??= await _initLocalDatabase();
  }

  Future<Database> _initLocalDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, DBConstant.dbName);
    var db = await openDatabase(path,
        version: DBConstant.dbVersion,
        onCreate: _onCreate,
        onUpgrade: _onUpgrade);
    return db;
  }

  ///Initial query script execution
  void _onCreate(Database db, int version) async {
    /// Add new table here for first version of application
    await db.execute(
        'CREATE TABLE ${DBConstant.tableUser} (${DBConstant.colUserId} INTEGER PRIMARY KEY, '
        '${DBConstant.colUserName} TEXT, '
        '${DBConstant.colUserEmail} TEXT, '
        '${DBConstant.colUserPhone} TEXT)');
  }

  /// Migration script execution
  void _onUpgrade(Database db, int oldVersion, int newVersion) async {
    Map<int, String> migrationScripts = _getMigrationScript();
    for (int i = oldVersion + 1; i <= newVersion; i++) {
      await db.execute(migrationScripts[i]!);
    }
  }

  Map<int, String> _getMigrationScript() {
    /// Add new table after publish first version
    /// Mew column in existing table
    Map<int, String> migrationScripts = {
      /*1: '''CREATE TABLE users (
              id INTEGER PRIMARY KEY,
              first_name TEXT)
              ''',
      2: 'ALTER TABLE users ADD last_name TEXT'*/
    };
    return migrationScripts;
  }

  /// Add and update
  Future<int> addUser(User user) async {
    Database db = await database;
    return db.insert(DBConstant.tableUser, user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<User>> getAllUsers() async {
    Database db = await database;
    var result = await db.query(DBConstant.tableUser);
    List<User> userList = [];
    for (var element in result) {
      userList.add(User.fromMap(element));
    }
    return userList;
  }
}
