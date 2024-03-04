part of 'list_bloc.dart';

@immutable
abstract class ListEvent extends Equatable{
  const ListEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetList extends ListEvent{}