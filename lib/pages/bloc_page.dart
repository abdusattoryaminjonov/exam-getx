import 'package:examgetxbloc/bloc/blocpage_bloc.dart';
import 'package:examgetxbloc/bloc/blocpage_event.dart';
import 'package:examgetxbloc/bloc/blocpage_state.dart';
import 'package:examgetxbloc/models/news_model.dart';
import 'package:examgetxbloc/views/item_of_blocpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class BlocPage extends StatefulWidget {
  const BlocPage({super.key});

  @override
  State<BlocPage> createState() => _BlocPageState();
}

class _BlocPageState extends State<BlocPage> {

  late BlocPageBloc blocpagebloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    blocpagebloc = context.read<BlocPageBloc>();
    blocpagebloc.add(LoadBlocPageNewsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BlocPageBloc, BlocPageState>(
      listener: (context, state){
      },
      builder: (context, state){
        if(state is BlocPageLoadingState){
          return viewBlocPage(true,[]);
        }
        if(state is BlocPageListState){
          return viewBlocPage(false, state.items);
        }
        return viewBlocPage(false,[]);
      },
    );
  }

  Widget viewBlocPage(bool isLoading,List<Article> list){
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.amberAccent,
          title: Text("BitCoin News Bloc",style: TextStyle(color: Colors.white),),
          leading: GestureDetector(
            onTap: () {
              blocpagebloc.add(LoadBlocPageNewsEvent());
            },
            child: Container(
              child: Image.asset("assets/images/bitcoin.png"),
            ),
          ),
        ),
        body:Stack(
          children: [
            ListView.builder(
              itemCount: list.length,
              itemBuilder: (ctx, index) {
                return itemOfBlocPage(list[index]);
              },
            ),
            isLoading
                ? Center(
              child: Lottie.asset("assets/lottie/loding.json"),
            )
                : SizedBox.shrink(),
          ],
        ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amberAccent,
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
