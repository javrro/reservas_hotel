import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class HotelDatabase {
  static const _databaseName = "HotelDB.db";
  static const _databaseVersion = 1;

  static const tableClientes = 'clientes';
  static const tableHabitaciones = 'habitaciones';
  static const tableReservas = 'reservas';

  HotelDatabase._privateConstructor();
  static final HotelDatabase instance = HotelDatabase._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    debugPrint("====> RUNNING DB CREATE");
    await db.execute('''
      CREATE TABLE $tableClientes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT NOT NULL,
        apellido TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        telefono TEXT,
        fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
      )
    ''');

    await db.execute('''
      CREATE TABLE $tableHabitaciones (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        numero_habitacion INTEGER NOT NULL UNIQUE,
        tipo TEXT NOT NULL,
        precio_por_noche REAL NOT NULL,
        estado TEXT DEFAULT 'disponible',
        descripcion TEXT DEFAULT '',
        miniatura INTEGER NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE $tableReservas (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        habitacion_id INTEGER NOT NULL,
        fecha_entrada TEXT DEFAULT '',
        fecha_salida TEXT DEFAULT '',
        estado TEXT DEFAULT 'reservada',
        total_noches INTEGER NOT NULL,
        precio_total REAL NOT NULL,
        FOREIGN KEY (habitacion_id) REFERENCES $tableHabitaciones (id)
      )
    ''');

    //insertar data de prueba
    await db.insert(tableHabitaciones, {
      'numero_habitacion': 102,
      'tipo': 'Doble',
      'precio_por_noche': 80.00,
      'estado': 'disponible',
      'descripcion': 'Sencilla 1 cama',
      'miniatura': 1
    });

    await db.insert(tableHabitaciones, {
      'numero_habitacion': 103,
      'tipo': 'Dos Camas',
      'precio_por_noche': 75.00,
      'estado': 'disponible',
      'descripcion': 'Sencilla 2 camas',
      'miniatura': 2
    });

    await db.insert(tableHabitaciones, {
      'numero_habitacion': 104,
      'tipo': 'Penhouse',
      'precio_por_noche': 500.00,
      'estado': 'disponible',
      'descripcion': 'Penhouse',
      'miniatura': 3
    });

    await db.insert(tableHabitaciones, {
      'numero_habitacion': 507,
      'tipo': 'Standard',
      'precio_por_noche': 125.00,
      'estado': 'disponible',
      'descripcion': 'Sencilla',
      'miniatura': 4
    });

    await db.insert(tableHabitaciones, {
      'numero_habitacion': 508,
      'tipo': 'Standard',
      'precio_por_noche': 125.00,
      'estado': 'disponible',
      'descripcion': 'Sencilla',
      'miniatura': 5
    });

    await db.insert(tableHabitaciones, {
      'numero_habitacion': 001,
      'tipo': 'Económica',
      'precio_por_noche': 1.00,
      'estado': 'disponible',
      'descripcion': 'Económica 1',
      'miniatura': 6
    });

    await db.insert(tableHabitaciones, {
      'numero_habitacion': 002,
      'tipo': 'Económica',
      'precio_por_noche': 1.00,
      'estado': 'disponible',
      'descripcion': 'Económica 2',
      'miniatura': 7
    });
  }

  // Insertar un cliente
  Future<int> insertarCliente(Map<String, dynamic> cliente) async {
    Database db = await instance.database;
    return await db.insert(tableClientes, cliente);
  }

  // Insertar una habitación
  Future<int> insertarHabitacion(Map<String, dynamic> habitacion) async {
    Database db = await instance.database;
    return await db.insert(tableHabitaciones, habitacion);
  }

  // Insertar una reserva
  Future<int> insertarReserva(Map<String, dynamic> reserva) async {
    Database db = await instance.database;
    return await db.insert(tableReservas, reserva);
  }

  // Obtener todos los clientes
  Future<List<Map<String, dynamic>>> obtenerClientes() async {
    Database db = await instance.database;
    return await db.query(tableClientes);
  }

  // Obtener todas las habitaciones
  Future<List<Map<String, dynamic>>> obtenerHabitaciones() async {
    Database db = await instance.database;
    return await db.query(tableHabitaciones);
  }

  // Obtener todas las reservas
  Future<List<Map<String, dynamic>>> obtenerReservas() async {
    Database db = await instance.database;
    //return await db.query(tableReservas);
    return await db.rawQuery('''
      SELECT * FROM $tableReservas
      LEFT JOIN $tableHabitaciones ON $tableReservas.habitacion_id = $tableHabitaciones.id
    ''');
  }

  // Obtener reservas por cliente
  Future<List<Map<String, dynamic>>> obtenerReservasPorCliente(
      int clienteId) async {
    Database db = await instance.database;
    return await db
        .query(tableReservas, where: 'cliente_id = ?', whereArgs: [clienteId]);
  }

  // Actualizar un cliente
  Future<int> actualizarCliente(int id, Map<String, dynamic> cliente) async {
    Database db = await instance.database;
    return await db
        .update(tableClientes, cliente, where: 'id = ?', whereArgs: [id]);
  }

  // Actualizar el estado de una habitación
  Future<int> actualizarEstadoHabitacion(int id, String estado) async {
    Database db = await instance.database;
    return await db.update(tableHabitaciones, {'estado': estado},
        where: 'id = ?', whereArgs: [id]);
  }

  // Eliminar un cliente por su id
  Future<int> eliminarCliente(int id) async {
    Database db = await instance.database;
    return await db.delete(tableClientes, where: 'id = ?', whereArgs: [id]);
  }

  // Eliminar una habitación por su id
  Future<int> eliminarHabitacion(int id) async {
    Database db = await instance.database;
    return await db.delete(tableHabitaciones, where: 'id = ?', whereArgs: [id]);
  }

  // Eliminar una reserva por su id
  Future<int> eliminarReserva(int id) async {
    Database db = await instance.database;
    return await db.delete(tableReservas, where: 'id = ?', whereArgs: [id]);
  }
}
