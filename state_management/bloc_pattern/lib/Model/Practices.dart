import './Practice.dart';
class Practices{
  late List<Practice> datas;

  //타입 메소드
  Practices.fromJsON(List<dynamic> json){
    datas = List<Practice>.empty(growable: true);
    
    
    //타입 명확하게
    for(Map<String, dynamic> arg in json){
      datas.add(Practice.fromJSON(arg));
    }
  }

}