// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:teams/core/models/list_class_model.dart';

abstract class IClassesStates {}

class LoadingClassesState extends IClassesStates {}

class IdleClassesState extends IClassesStates {}

class FailureClassesState extends IClassesStates {}

class SuccesLoadedClassesState extends IClassesStates {
  ListClassModel listClassModel;
  SuccesLoadedClassesState({
    required this.listClassModel,
  });
}
