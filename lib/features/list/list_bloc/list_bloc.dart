import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:multi_feature_app/features/list/repository/List_repository.dart';

import '../model/list_model.dart';

part 'list_event.dart';
part 'list_state.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc() : super(ListInitial()) {
    final ListRepository listRepository = ListRepository();
    on<ListEvent>((event, emit) async {
     try{
       emit(ListLoading());
       final List<ListModel> list = await listRepository.fetchList();
       emit(ListLoaded(list: list));
       if(list[0].error!=null){
         emit(ListError(error: list[0].status));
       }
     } on NetworkError{
       emit(const ListError(error: "Failed to fetch data is your device online"));
     }
    });
  }
}
