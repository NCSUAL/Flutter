import '../repository/Test_Repository.dart';
import 'package:rxdart/rxdart.dart';
import '../Model/Practices.dart';
class Api_bloc{
    final Test_Repository test_repository = new Test_Repository();
    PublishSubject<Practices> ps = new PublishSubject();

    Stream<Practices> get stream => ps.stream;  //get -> 메소드를 변수로 축약함 k: function(){}

    Future<void> api_bloc_start() async{
        final Practices datas = await test_repository.data_load();
        ps.sink.add(datas);
    }
}