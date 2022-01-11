import 'package:majootestcase/models/user.dart';
import 'package:sqflite/sqflite.dart';

const String tableUser = 'user';
const String columnId = 'id';
const String columnEmail = 'email';
const String columnUsername = 'userName';
const String columnPassword = 'password';

class DBHelper {
  static Database? _database;
  static DBHelper? _dbHelper;

  DBHelper._createInstance();
  factory DBHelper() {
    if (_dbHelper == null) {
      _dbHelper = DBHelper._createInstance();
    }
    return _dbHelper!;
  }

  Future<Database> get database async {
    print('Database');
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  Future<List<User>> getUser() async {
    List<User> _user = [];

    var db = await this.database;
    var result = await db.query(tableUser);
    result.forEach((element) {
      var _users = User.fromJson(element);
      _user.add(_users);
    });

    return _user;
  }

  Future<List<User>> loadUser() async {
    Future<List<User>> _futureUserList;

    _futureUserList = _dbHelper!.getUser();

    return _futureUserList;
  }

  Future<Database> initializeDatabase() async {
    var dir = await getDatabasesPath();
    var path = dir + "user.db";

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          create table $tableUser ( 
          $columnId integer primary key autoincrement, 
          $columnEmail text not null,
          $columnUsername text not null,
          $columnPassword text not null)
        ''');
      },
    );
    return database;
  }

  void insertUser(User user) async {
    var db = await this.database;
    var result = await db.insert(tableUser, user.toJson());
    print('result : $result');
  }

  Future<int> delete(String id) async {
    var db = await this.database;
    var result =
        await db.delete(tableUser, where: '$columnId = ?', whereArgs: [id]);
    print('result deleted : $result');
    return result;
  }
}
