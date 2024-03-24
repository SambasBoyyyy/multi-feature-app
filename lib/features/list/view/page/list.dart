import 'package:flutter/material.dart';
import 'package:multi_feature_app/features/list/model/list.dart';
import 'package:multi_feature_app/features/list/model/result.dart';
import 'package:multi_feature_app/features/list/view/list_bloc/list_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late final ListBloc _listBloc;

  @override
  void initState() {
    super.initState();
    _listBloc = ListBloc()..add(GetList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Screen'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () => {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () => {}, icon: const Icon(Icons.edit)),
        ],
      ),
      body: _buildList(context),
    );
  }

  Widget _buildList(BuildContext context) {
    return BlocProvider(
      create: (context) => _listBloc,
      child: BlocBuilder<ListBloc, ListState>(
        builder: (context, state) {
          if (state is ListError) {
            return Center(child: Text(state.error));
          } else if (state is ListInitial || state is ListLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ListLoaded) {
            return ListView.builder(
              reverse: true,
              itemCount: state.list.length,
              itemBuilder: (context, index) {
                Results listModel = state.list[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Text(listModel.title ?? 'No title'),
                     leading: IconButton(onPressed: () => {}, icon: const Icon(Icons.check_box_outline_blank)),
                     subtitle: Text(listModel.description??"No Des"),
                    onTap: (){},
                  ),
                );
              },
            );
          } else {
            return Container(); // Return a default empty container
          }
        },
      ),
    );
  }
}
