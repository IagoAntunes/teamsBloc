import 'package:flutter_modular/flutter_modular.dart';
import 'package:teams/core/database/hive_db.dart';
import 'package:teams/core/models/class_model.dart';
import 'package:teams/core/models/list_class_model.dart';

abstract class IClassRepository {
  Future<ListClassModel?> getClasses();
  Future<ListClassModel> addClasses(String nameClass);
  Future<ListClassModel> deleteClass(ClassModel classModel);
}

class ClassRepository extends IClassRepository {
  @override
  Future<ListClassModel?> getClasses() async {
    Database db = Modular.get<Database>();
    ListClassModel? listClass = await db.get('0');
    await Future.delayed(const Duration(seconds: 5));
    return listClass;
  }

  @override
  Future<ListClassModel> addClasses(String nameClass) async {
    Database db = Modular.get<Database>();
    ListClassModel? listClassModel = await db.get('0');
    //Se não tiver criado o banco ainda...
    if (listClassModel == null) {
      await db.put(
        ListClassModel(
          listClassModel: [
            ClassModel(id: 'id', name: nameClass, teamA: [], teamB: []),
          ],
        ),
        '0',
      );
      return ListClassModel(
        listClassModel: [
          ClassModel(id: 'id', name: nameClass, teamA: [], teamB: []),
        ],
      );
    } else {
      //Se o banco ja tiver sido criado
      listClassModel.listClassModel.add(
        ClassModel(
          id: 'id',
          name: nameClass,
          teamA: [],
          teamB: [],
        ),
      );
      await db.put(listClassModel, '0');
    }

    return listClassModel;
  }

  @override
  Future<ListClassModel> deleteClass(ClassModel classModel) async {
    Database db = Modular.get<Database>();
    ListClassModel? listClassModel = await db.get('0');

    listClassModel!.listClassModel
        .removeWhere((element) => element.name == classModel.name);
    await db.put(listClassModel, '0');
    return listClassModel;
  }
}
