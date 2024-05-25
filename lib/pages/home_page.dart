import 'package:examgetxbloc/bloc/blocpage_bloc.dart';
import 'package:examgetxbloc/pages/bloc_page.dart';
import 'package:examgetxbloc/pages/getx_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.amberAccent,
          title: Text("Exam GetX and Bloc",style: TextStyle(color: Colors.white),),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 30,right: 30,top: 30),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 45,
                  width: double.infinity,
                  child: MaterialButton(
                    child: Text("News in GetX"),
                    color: Colors.amberAccent,
                    textColor: Colors.white,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> const GetxPage()));
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 45,
                  width: double.infinity,
                  child: MaterialButton(
                    child: Text("News in Bloc"),
                    color: Colors.amberAccent,
                    textColor: Colors.white,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=> BlocProvider(
                        create: (context) => BlocPageBloc(),
                          child: BlocPage(),
                          )
                        )
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        )

    );
  }
}
