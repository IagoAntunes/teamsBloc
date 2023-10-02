import '../../../core/models/class_model.dart';

abstract class IParticipantsEvents {}

class AddParticipantEvent extends IParticipantsEvents {
  ClassModel classModel;
  int indexTeam;
  String name;
  AddParticipantEvent({
    required this.classModel,
    required this.indexTeam,
    required this.name,
  });
}

class RemoveParticipantEvent extends IParticipantsEvents {}
