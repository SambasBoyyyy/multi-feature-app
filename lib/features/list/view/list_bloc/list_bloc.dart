import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../repository/List_repository.dart';
import '../../model/list_model_0.dart';




part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc() : super(ListInitial()) {
    final ListRepository listRepository = ListRepository();
    on<ListEvent>((event, emit) async {
     try{
       emit(ListLoading());
       print('list created');
       final List<ListModel> list = await listRepository.fetchList();
       print(list);
       emit(ListLoaded(list: list));
       if(list[0].error!=null){
         print('here');
         emit(ListError(error: list[0].status));
       }
     } on NetworkError{
       emit(const ListError(error: "Failed to fetch data is your device online"));
     }
    });
  }
}
