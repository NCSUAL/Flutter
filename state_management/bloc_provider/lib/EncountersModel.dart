import 'package:equatable/equatable.dart';

class EncounterModel extends Equatable{
  final int userId;
  final int id;
  final String title;
  final String body;

  EncounterModel({required this.userId,required this.id,required this.title,required this.body});

  factory EncounterModel.fromJson(Map<String, dynamic> Json) => EncounterModel(
      userId: Json["userId"],
      id: Json["id"],
      title: Json["title"],
      body: Json["body"]
  );

  //private + getter (setter 제외)
  @override
  // TODO: implement props
  List<Object?> get props => [this.userId,this.id,this.title,this.body];
}


class MappingEncounterModel extends Equatable{
  //상태관리 할 데이터 타입
  late List<EncounterModel> datas;


  MappingEncounterModel.fromJson(List<dynamic> Json){
    //ArrayList 선언
    datas = List<EncounterModel>.empty(growable: true);

    for(int a=0; a<Json.length; a++){
      datas.add(EncounterModel.fromJson(Json[a]));
    }
  }

  //private + getter (setter 제외)
  @override
  // TODO: implement props
  List<Object?> get props => [datas];
}