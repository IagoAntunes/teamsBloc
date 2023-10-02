import 'package:bloc/bloc.dart';
import 'package:teams/core/models/participants_model.dart';
import 'package:teams/src/bloc/participants/participants_events.dart';
import 'package:teams/src/bloc/participants/participants_states.dart';

class ParticipantBloc extends Bloc<IParticipantsEvents, IParticipantsStates> {
  ParticipantBloc() : super(IdleParticipantsState()) {
    //
    on((event, emit) => mapEvent(event, emit));
  }

  mapEvent(Object? event, Emitter emit) async {
    emit(LoadingParticipantState());
    if (event is AddParticipantEvent) {
      if (event.indexTeam == 0) {
        event.classModel.teamA.add(ParticipantModel(name: event.name));
        emit(SuccessParticipantState(listParticipants: event.classModel.teamA));
      } else {
        event.classModel.teamB.add(ParticipantModel(name: event.name));
        emit(SuccessParticipantState(listParticipants: event.classModel.teamB));
      }
    }
  }
}
