import 'package:bloc/bloc.dart';
import 'package:examgetxbloc/bloc/blocpage_event.dart';
import 'package:examgetxbloc/bloc/blocpage_state.dart';

import '../models/news_model.dart';
import '../services/http_servic.dart';

class BlocPageBloc extends Bloc<BlocPageEvent, BlocPageState> {

  List<Article> newsList = [];


  BlocPageBloc() : super(BlocPageInitialState()) {
    on<LoadBlocPageNewsEvent>(_onLoadBlocPageNewsEvent);
  }

  Future<void> _onLoadBlocPageNewsEvent(LoadBlocPageNewsEvent event, Emitter<BlocPageState> emit) async {
    emit(BlocPageLoadingState());
    var response = await Network.GET(Network.API_SEARCH, Network.paramsCoinNewsList());

    if (response != null){
      newsList =  Network.parseCoinNewsList(response);
      emit(BlocPageListState(items: newsList));
    }else{
      emit(BlocPageErrorState("Not found news"));
    }
  }
}