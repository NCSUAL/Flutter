import 'package:bloc/bloc.dart';
import 'package:bloc_provider/TestModel.dart';

class Test_Cubit extends Cubit<TestModel>{

  Test_Cubit(): super(TestModel(name: "test",count: 0));

  void addCount(){
    emit(state.copyWith(count: state.count+1));
  }

  void changeName(){
    emit(state.copyWith(name: 'change'));
  }
}