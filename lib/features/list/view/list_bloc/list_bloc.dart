import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../repository/List_repository.dart';
import '../../model/list.dart';




part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc() : super(ListInitial()) {
    final ListRepository listRepository = ListRepository();
    on<ListEvent>((event, emit) async {
     try{
       emit(ListLoading());

       ListModel list = await listRepository.fetchList();
       print(list.data.results[0].title);
       emit(ListLoaded(list: list));
       print('list created');
       if(list.error==null){
         print(list.error);
         emit(ListError(error: list.status));
       }
     } on NetworkError{
       emit(const ListError(error: "Failed to fetch data is your device online"));
     }
    });
  }
}
