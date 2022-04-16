import 'package:flutter/material.dart';
import 'package:test_app/model/user.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({ Key? key, required this.user }) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: Row(
            children: [
              const Icon(Icons.person, size: 80,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                SizedBox(child: Text('name: ${user.name}')),
                SizedBox(child: Text('email: ${user.email}')),
                SizedBox(child: Text('phone: ${user.phone}')),
                SizedBox(child: Text('website: ${user.website}')),
              ],),
            ],
          )
        ),
      );
  }
}