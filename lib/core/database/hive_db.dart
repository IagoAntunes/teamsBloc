import 'dart:async';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:teams/core/models/list_class_model.dart';

import '../models/class_model.dart';

class Database {
  final completer = Completer<Box>();

  Database() {
    _initDb();
  }
  Future _initDb() async {
    var appDocDirectory = await getApplicationDocumentsDirectory();
    if (Hive.isAdapterRegistered(1) == false) {
      Hive
        ..init(appDocDirectory.path)
        ..registerAdapter(ListClassModelAdapter());
    }

    final box = await Hive.openBox('cache');
    if (!completer.isCompleted) completer.complete(box);
  }

  Future<void> put(ListClassModel data, String id) async {
    final box = await completer.future;
    box.put(id, data.toMap());
  }

  Future<ListClassModel?> get(String id) async {
    final box = await completer.future;
    final data = await box.get(id);

    if (data == null) return null;
    final List<dynamic> listData = data['listClassModel'];
    final List<ClassModel> classList = listData
        .map((item) => ClassModel.fromMap(
            item)) // Use o construtor apropriado para ClassModel
        .toList();
    return ListClassModel(
      listClassModel: classList,
    );
  }
}
