import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/users_data_bloc/usersdata_bloc.dart';
import 'package:test_app/screens/users_screen/components/user_item.dart';

class UsersBody extends StatelessWidget {
  const UsersBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UsersdataBloc usersBloc = BlocProvider.of<UsersdataBloc>(context);
    usersBloc.add(GetUsersEvent());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Список пользователей'),
      ),
      body: BlocBuilder<UsersdataBloc, UsersdataState>(
        builder: (context, state) {
        if (state is UsersdataInitial) {
        return const SizedBox();
      }

      if (state is LoadingUsersState) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is LoadedUsersState) {
        return ListView.builder(
              itemCount: state.usersList!.length,
              itemBuilder: (context, index) {
                return UserItem(user: state.usersList![index]);
              });
      }

      if (state is ErrorLoadUsersState) {
        return const Center(child: Center(child: Text('')));
      }
      return const SizedBox();
    })
          
      );
  }
}
