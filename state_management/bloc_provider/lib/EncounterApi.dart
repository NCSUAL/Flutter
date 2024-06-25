import 'package:bloc_provider/EncountersModel.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class EncounterApi extends Equatable{
  static final Dio dio = new Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));

  Future<MappingEncounterModel> encounter_Get() async{
      final Response response = await dio.get('/posts');

      if(response.statusCode==200){
         return MappingEncounterModel.fromJson(response.data);
      }
      else{
        throw Exception("Api 호출 실패");
      }
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];

}