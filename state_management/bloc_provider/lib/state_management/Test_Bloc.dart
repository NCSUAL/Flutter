
import 'package:bloc/bloc.dart';
import 'package:bloc_provider/TestModel.dart';
import 'package:equatable/equatable.dart';

class Test_Bloc extends Bloc<EventManager, TestModel>{
  Test_Bloc() : super(TestModel(name: "test",count: 0)){
    on<AddCountEvent>((event, emit) {
      emit(state.copyWith(count: state.count+1));
    },);
    on<ChangeNameEvent>((event, emit) {
      emit(state.copyWith(name: 'change'));
    },);
  }
}

abstract class EventManager extends Equatable {}

class AddCountEvent extends EventManager{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChangeNameEvent extends EventManager{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}