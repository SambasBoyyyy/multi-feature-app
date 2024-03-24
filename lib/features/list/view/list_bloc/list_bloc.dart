import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:multi_feature_app/features/list/model/result.dart';

import '../../../../repository/List_repository.dart';
import '../../model/list.dart';




part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc() : super(ListInitial()) {
    final ListRepository listRepository = ListRepository();
    int page = 1;
    on<ListEvent>((event, emit) async {
     try{

       if (state is ListLoading) return;
       final currentState = state;

       var oldLists = <Results>[];
       if (currentState is ListLoaded) {
         oldLists = currentState.list;
       }

       emit(ListLoading(oldLists, isFirstFetch: page == 1));

       // print(list.data.results[0].title);
       listRepository.fetchList(page).then((newLists) {
         page++;

         final lists = (state as ListLoading).oldPosts;
         lists.addAll(newLists.data.results);

         emit(ListLoaded(list:lists));

         if(newLists.error==null){
           print(newLists.error);
           emit(ListError(error: newLists.status));
         }
       });

       // print('list created');

     } on NetworkError{
       emit(const ListError(error: "Failed to fetch data is your device online"));
     }
    });
  }
}
