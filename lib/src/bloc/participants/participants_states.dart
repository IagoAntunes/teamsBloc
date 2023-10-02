import 'package:teams/core/models/participants_model.dart';

abstract class IParticipantsStates {}

class IdleParticipantsState extends IParticipantsStates {}

class LoadingParticipantState extends IParticipantsStates {}

class SuccessParticipantState extends IParticipantsStates {
  List<ParticipantModel> listParticipants;
  SuccessParticipantState({
    required this.listParticipants,
  });
}
