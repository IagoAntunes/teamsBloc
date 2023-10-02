import 'package:teams/core/models/class_model.dart';

abstract class IClassesEvents {}

class GetClassesEvent extends IClassesEvents {}

class AddClassEvent extends IClassesEvents {
  String nameClass;
  AddClassEvent({
    required this.nameClass,
  });
}

class DeleteClassEvent extends IClassesEvents {
  ClassModel classModel;
  DeleteClassEvent({
    required this.classModel,
  });
}
