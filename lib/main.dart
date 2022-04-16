import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/bloc/posts_bloc/posts_bloc.dart';
import 'package:test_app/bloc/users_data_bloc/usersdata_bloc.dart';
import 'package:test_app/services/post_services/post_repository.dart';
import 'package:test_app/services/user_services/user_repository.dart';

import 'screens/users_screen/users_body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Map<int, Color> colorCodes = {
      50: const Color(0xFF522e23),
      100: const Color(0xFF522e23),
      200: const Color(0xFF522e23),
      300: const Color(0xFF522e23),
      400: const Color(0xFF522e23),
      500: const Color(0xFF522e23),
      600: const Color(0xFF522e23),
      700: const Color(0xFF522e23),
      800: const Color(0xFF522e23),
      900: const Color(0xFF522e23),
    };
    final userRepository = UserRepository();
    final postRepository = PostRepository();
    return MultiProvider(
      providers: [
        Provider<UsersdataBloc>(create: (_) => UsersdataBloc(usersRepository: userRepository),),
        Provider<PostsBloc>(create: (_) => PostsBloc(postsRepository: postRepository),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFe1dacc),
          primarySwatch: MaterialColor(0xFF522e23, colorCodes),
                ),
        home: const SafeArea(child: UsersBody())
      ),
    );
  }
}
