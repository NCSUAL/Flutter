import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_layout/Model/Practice.dart';
import 'package:responsive_layout/View/ResponsiveUi.dart';

import '../Model/Practices.dart';
import 'package:flutter/material.dart';
import '../bloc/Api_bloc.dart';

class responseive_layout extends StatefulWidget {
  const responseive_layout({super.key});

  @override
  State<responseive_layout> createState() => _responseive_layoutState();
}

class _responseive_layoutState extends State<responseive_layout> {

  final Api_bloc api_bloc = new Api_bloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    api_bloc.api_bloc_start();
  }

  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;       //현재 기기의 가로길이를 가져옴
    final double height = MediaQuery.of(context).size.height;     //현재 기기의 세로길이를 가져옴

    return Scaffold(
      
      backgroundColor: Colors.white,

        body: SafeArea(         //* os 침입을 막음

          child: Column(
          
            children: [

              Expanded(       //* expanded의 상위 위젯은 column,row,flex만 가능

                  child: Padding(
                padding: EdgeInsets.symmetric(

                  horizontal: width * 0.02, //* width -가로
                  vertical: height * 0.02   //* heigth -세로

                ),

                child: Container(
                  width: width,
                  height: height,

                  child:  Padding(

                    padding: EdgeInsets.symmetric(
                      horizontal: width*0.03, //* width -가로
                      vertical: height*0.01   //* heigth -세로
                    ),


                    child: Column(
                      children: [
                        //반응형 폰트
                         responsive_Font(context,0.07,FontWeight.w600,Colors.black,null, "반응형 레이아웃"),

                        SizedBox(height: height*0.01,),

                        Expanded(child:
                            StreamBuilder<Practices>(stream: api_bloc.stream,builder: (context, snapshot) {
                              if(snapshot.hasData){
                                List<Practice>? datas = snapshot?.data?.datas;
                                return ListView.builder(itemCount: datas?.length,itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      //반응형 폰트
                                      responsive_Font(context, 0.06,FontWeight.w500,Colors.grey[600], Alignment.topLeft,"INDEX: ${datas?[index].id}"),


                                    Container(
                                      width: width*0.8,
                                      height: height*0.3,
                                      child: Column(

                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            color: Colors.blueAccent,
                                            width: width*0.8,
                                            height: height*0.03,
                                            child: Center(child: Text("데이터",style: TextStyle(fontWeight: FontWeight.w600),)),
                                          ),

                                          Padding(padding: EdgeInsets.symmetric(
                                            horizontal: width*0.03,   //* width -가로
                                            vertical: height*0.005 //* height -가로
                                          ),

                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                responsive_Font(context,0.05,FontWeight.w600,Colors.black,Alignment.topLeft,
                                                    "POSTID: ${datas?[index].postId}"+"\n"
                                                        "BODY: ${datas?[index].body}"+"\n"
                                                        "NAME: ${datas?[index].name}"+"\n"
                                                        "EMAIL: ${datas?[index].email}"
                                                ),
                                            ],),
                                          )
                                        ],
                                      ),
                                      decoration: BoxDecoration(border: Border(
                                          bottom: BorderSide(width: 18,color: Colors.blueAccent),
                                          left: BorderSide(width: 18,color: Colors.blueAccent),
                                          right: BorderSide(width: 18,color: Colors.blueAccent),
                                      ),
                                      ),
                                    ),

                                    SizedBox(height: height*0.01,)

                                  ],);

                                },);
                              }
                              else{
                                return Container(
                                  width: width*0.1,
                                  height: height*0.1,
                                  child: Center(
                                    child: CircularProgressIndicator(strokeWidth: 3,),
                                  ),
                                );
                              }
                            },)
                        ),



                      ],


                    ),
                  ),

                decoration: BoxDecoration(border: Border.all(
                  width: 2,
                  color: Colors.black
                )),
                ),
              ))
            ],
          
          ),
        )
    );
  }
}
