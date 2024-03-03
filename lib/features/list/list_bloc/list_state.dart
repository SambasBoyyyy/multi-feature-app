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
  https://www.youtube.com/watch?v=rG7LY0BkvG8
}
class ListError extends ListState {}
