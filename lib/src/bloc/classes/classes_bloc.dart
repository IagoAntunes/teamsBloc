import 'package:bloc/bloc.dart';
import 'package:teams/core/models/list_class_model.dart';

import '../../repository/class_repository.dart';
import 'classes_events.dart';
import 'classes_states.dart';

class ClassesBloc extends Bloc<IClassesEvents, IClassesStates> {
  IClassRepository repository;
  ClassesBloc({
    required this.repository,
  }) : super(IdleClassesState()) {
    on((event, emit) => mapEvent(event, emit));
  }
  ListClassModel? listClassModel;
  mapEvent(Object? event, Emitter emit) async {
    emit(LoadingClassesState());
    if (event is GetClassesEvent) {
      ListClassModel? listClasses = await repository.getClasses();
      if (listClasses == null) {
        emit(FailureClassesState());
      } else {
        listClassModel = listClasses;

        emit(SuccesLoadedClassesState(listClassModel: listClasses));
      }
    } else if (event is AddClassEvent) {
      listClassModel = await repository.addClasses(event.nameClass);
      emit(SuccesLoadedClassesState(listClassModel: listClassModel!));
    } else if (event is DeleteClassEvent) {
      listClassModel = await repository.deleteClass(event.classModel);
      emit(SuccesLoadedClassesState(listClassModel: listClassModel!));
    }
  }
}
