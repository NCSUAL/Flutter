import 'package:bloc/bloc.dart';
import 'package:bloc_provider/EncountersModel.dart';
import 'package:equatable/equatable.dart';
import '../EncounterApi.dart';
class EncounterBloc extends Bloc<EncounterEvent,EncounterState>{
  late EncounterApi encounterApi;

  EncounterBloc(): super(InitEncounterState()){
    //api 호출
    encounterApi = new EncounterApi();

    //데이터 불러오기
    on<LoadEncounterDataEvent>((event, emit) async{
      MappingEncounterModel encounter_get = await encounterApi.encounter_Get();
      emit(LoadingEnncounterState(encounterData: encounter_get.datas));
    });
  }
}

//event
abstract class EncounterEvent extends Equatable{}

//event 자식
class LoadEncounterDataEvent extends EncounterEvent{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//state
abstract class EncounterState extends Equatable{
  final List<EncounterModel> encounterData;

  const EncounterState({required this.encounterData});
}

//state 자식
class InitEncounterState extends EncounterState{
  InitEncounterState() : super(encounterData: []);
  @override
  // TODO: implement props
  List<Object?> get props => [super.encounterData];
}

class LoadingEnncounterState extends EncounterState{
  const LoadingEnncounterState({required super.encounterData});

  @override
  // TODO: implement props
  List<Object?> get props => [super.encounterData];

}

