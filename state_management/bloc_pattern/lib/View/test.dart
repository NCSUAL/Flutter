import 'package:bloc_pattern/Model/Practices.dart';
import 'package:flutter/material.dart';
import '../bloc/Api_bloc.dart';
class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  Api_bloc api_bloc = new Api_bloc();
  @override
  void initState() {
    // TODO: implement initState
    api_bloc.api_bloc_start();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<Practices>(
        stream: api_bloc.stream,
        builder: (context, snapshot) => ListView.builder(
          itemCount: snapshot?.data?.datas.length,
          itemBuilder: (context, index) {
            if(snapshot.hasData){
              return Column(
                  children: [
                    Text("postId: ${snapshot.data?.datas[index].postId}"),
                    Text("id: ${snapshot.data?.datas[index].id}"),
                    Text("name: ${snapshot.data?.datas[index].name}"),
                    Text("email: ${snapshot.data?.datas[index].email}"),
                    Text("body: ${snapshot.data?.datas[index].body}"),
            ],
                crossAxisAlignment: CrossAxisAlignment.start,
              );
            }
            else{
              return Text("에러남");
            }
          },
        ),),
    );
  }
}
