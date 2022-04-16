import 'package:test_app/services/user_services/user_api_provider.dart';

class UserRepository {

    final UserProvider _userProvider = UserProvider();
  Future fetchUsers() => _userProvider.fetchUsers();
  
}