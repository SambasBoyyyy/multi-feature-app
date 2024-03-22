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
              itemCount: state.list.data.results.length,
              itemBuilder: (context, index) {
                Results listModel = state.list.data.results[index];
                return ListTile(
                  title: Text(listModel.title ?? 'No title'),
                   subtitle: Text(listModel.description??"No Des"),
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
