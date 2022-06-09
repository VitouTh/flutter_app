import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:movie_app/pass_model/carmodel.dart';

class CarsDatabase {

  static final CarsDatabase instance = CarsDatabase._init();

  static Database? _database;

  CarsDatabase._init();

  Future<Database> get database async {

    if (_database != null) return _database!;

    _database = await _initDB('car.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {

    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {

    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    // final integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableCar (
  ${CarFields.id} $idType,
  ${CarFields.name} $textType,
  ${CarFields.price} $textType
  );
''');
  }

  Future<Car> create(Car car) async {
    final db = await instance.database;
    //
    // // final json = note.toJson();
    // // final columns =
    // //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    // // final values =
    // //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    // // final id = await db
    // //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');
    //
    final id = await db.insert(tableCar, car.toJson());
    return car.copy(id: id);
  }

  Future<List<Car>> readAllCars() async {
    final db = await instance.database;

    final orderBy = '${CarFields.id} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(tableCar, orderBy: orderBy);

    return result.map((json) => Car.fromJson(json)).toList();
  }

  // Future<int> update(Note note) async {
  //   final db = await instance.database;
  //
  //   return db.update(
  //     tableNotes,
  //     note.toJson(),
  //     where: '${NoteFields.id} = ?',
  //     whereArgs: [note.id],
  //   );
  // }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableCar,
      where: '${CarFields.id} = ?',
      whereArgs: [id],
    );
  }

// Future close() async {
//   final db = await instance.database;
//
//   db.close();
// }
}