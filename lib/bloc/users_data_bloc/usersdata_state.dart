part of 'usersdata_bloc.dart';

@immutable
abstract class UsersdataState {}

class UsersdataInitial extends UsersdataState {}

class LoadingUsersState extends UsersdataState {}
class LoadedUsersState extends UsersdataState {
 
  LoadedUsersState({required this.usersList
   });
  final  List? usersList;

}
class ErrorLoadUsersState extends UsersdataState {}
