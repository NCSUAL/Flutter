import 'package:bloc/bloc.dart';

class Test_Cubit extends Cubit<int>{
  //자식 생성자 호출 -> 부모 호출
  Test_Cubit() : super(0);
  /**
  * Test_Cubit(super.initial) ->  생성할 때 부모 호출
  */

  void addCount(){
    emit(state +1);
  }

  void substractCount(){
    emit(state -1);
  }

}