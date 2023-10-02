// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';

import 'package:teams/core/models/participants_model.dart';

part 'class_model.g.dart';

@HiveType(typeId: 1)
class ClassModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  List<ParticipantModel> teamA;
  @HiveField(2)
  List<ParticipantModel> teamB;
  @HiveField(3)
  String id;
  ClassModel({
    required this.id,
    required this.name,
    required this.teamA,
    required this.teamB,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'teamA': teamA.map((x) => x.toMap()).toList(),
      'teamB': teamB.map((x) => x.toMap()).toList(),
      'id': id,
    };
  }

  factory ClassModel.fromMap(Map<dynamic, dynamic> map) {
    return ClassModel(
      name: map['name'] as String,
      teamA: List<ParticipantModel>.from(
        (map['teamA'] as List<dynamic>).map<ParticipantModel>(
          (x) => ParticipantModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      teamB: List<ParticipantModel>.from(
        (map['teamB'] as List<dynamic>).map<ParticipantModel>(
          (x) => ParticipantModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassModel.fromJson(String source) =>
      ClassModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
