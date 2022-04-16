import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_app/services/user_services/user_repository.dart';

part 'usersdata_event.dart';
part 'usersdata_state.dart';

class UsersdataBloc extends Bloc<UsersdataEvent, UsersdataState> {
  UsersdataBloc({required this.usersRepository}) : super(UsersdataInitial());
  final UserRepository usersRepository;
  @override
  Stream<UsersdataState> mapEventToState(UsersdataEvent event) async* {
    if (event is GetUsersEvent) {
      yield LoadingUsersState();
      try {
        final List _loadedUsers= await usersRepository.fetchUsers();
        yield LoadedUsersState(usersList: [..._loadedUsers] );
      } catch (_) {
        yield ErrorLoadUsersState();
      }
    } 
  }
}
