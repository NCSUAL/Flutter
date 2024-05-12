import 'dart:convert';

import 'package:http/http.dart';
import '../Model/Practices.dart';
class Api_provider{
  final Client client = new Client();
  
  Future<Practices> get_api_test() async{
    final Response datas = await client.get(Uri.parse("https://jsonplaceholder.typicode.com/comments?postId=1"));

    if(datas.statusCode== 200){
      List<dynamic> convert = jsonDecode(datas.body);
      /**
       * 타입을 명시하지 않은 이유
       * ReponseEntity ResponseBody등 xml json이 아닌 타입도 있기 때문에 데이터를 받은 순간은 dynamic으로 정함
       */
      return Practices.fromJsON(convert);
    }
    else{
      throw Exception("에러남");
    }


  } 
}