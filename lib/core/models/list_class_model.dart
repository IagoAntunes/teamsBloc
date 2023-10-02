// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';

import 'package:teams/core/models/class_model.dart';

part 'list_class_model.g.dart';

@HiveType(typeId: 3)
class ListClassModel extends HiveObject {
  @HiveField(0)
  List<ClassModel> listClassModel;
  ListClassModel({
    required this.listClassModel,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'listClassModel': listClassModel.map((x) => x.toMap()).toList(),
    };
  }

  factory ListClassModel.fromMap(Map<String, dynamic> map) {
    return ListClassModel(
      listClassModel: List<ClassModel>.from(
        (map['listClassModel'] as List<int>).map<ClassModel>(
          (x) => ClassModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ListClassModel.fromJson(String source) =>
      ListClassModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
