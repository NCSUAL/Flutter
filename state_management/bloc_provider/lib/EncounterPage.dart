

import 'package:bloc_provider/state_management/EncounterBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EncounterPage extends StatelessWidget {

  const EncounterPage({super.key});

  Future<void> get_data(BuildContext context) async{
    context.read<EncounterBloc>().add(LoadEncounterDataEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<EncounterBloc, EncounterState>(builder: (context, state) {
        return FutureBuilder(
          future: get_data(context),
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: state.encounterData.length,
              itemBuilder: (context, index) {
                return Container(child: Column(
                  children: [
                    Text(state.encounterData[index].title),
                  ],
                ),);
              },);
          },

        );
      },),
    );
  }
}
