part of 'list_bloc.dart';

@immutable
abstract class ListState extends Equatable{
  const ListState();
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class ListInitial extends ListState {}
class ListLoading extends ListState {}
class ListLoaded extends ListState {
 final List<ListModel> list;
const ListLoaded({required this.list});
}
class ListError extends ListState {
  final String error;
  const ListError({required this.error});
}
