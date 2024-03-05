import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_feature_app/features/list/model/list_model.dart';
import 'package:multi_feature_app/features/list/view/list_bloc/list_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  final ListBloc _listBloc = ListBloc();

  @override
  void initState() {
    _listBloc.add(GetList());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget _buildList() {
    return Card(
      child: Container(
          padding: const EdgeInsets.all(20.0),
          child:BlocProvider(
            create:(context)=>_listBloc,
            child: BlocBuilder(
                builder:(context,state){
                  if(state is ListError){
                    return Center(child: Text(state.error));
                  }else if(state is ListInitial){
                    return const CircularProgressIndicator();
                  }else if(state is ListLoading){
                    return const CircularProgressIndicator();
                  }else if(state is ListLoaded){
                    return ListView.builder(
                      itemCount: state.list.length,
                        itemBuilder: (context,index){
                        ListModel listModel = state.list[index];
                        return ListTile(
                            title: Text(listModel.message),
                          // subtitle: Text(listModel.data.results),
                        );
                        }
                    );
                  }else{
                    return Container();
                  }
                },
            ),
          )
      ),
    );
  }


}
