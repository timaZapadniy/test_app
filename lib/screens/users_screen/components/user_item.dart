import 'package:flutter/material.dart';
import 'package:test_app/model/user.dart';
import 'package:test_app/screens/user_details_screen/user_details.dart';

class UserItem extends StatelessWidget {
  const UserItem({ Key? key, required this.user }) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, left: 4, right: 4),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.brown[200],
          boxShadow: [
            
                  BoxShadow(
                    offset: const Offset(0, 0),
                    blurRadius: 3,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ],
        ),
        child: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  UserDetails(user: user,)));
          },
          child: SizedBox(
            
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Icon(Icons.person, size: 50,),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text('${user.username}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text('${user.name}'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}