import 'package:flutter/material.dart';
import 'package:test_app/model/post.dart';
import 'package:test_app/model/user.dart';
import 'package:test_app/screens/post_details_screen/components/comments.dart';
import 'package:test_app/screens/user_details_screen/user_details.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key, required this.post, required this.user})
      : super(key: key);
  final Post post;
  final User user;
  void _addComment (context){
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        elevation: 8,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft : Radius.circular(15),topRight : Radius.circular(15))),
        builder: (BuildContext context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height*0.7,
          );});
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
               PostPublisher(user: user,),
               PostFull(post: post,),
               Comments(post: post,)
              ],
            ),
          ),
        ),
        const Divider(
              height: 2,
              color: Color(0xFF522e23),
            ),
        SizedBox(
          width: double.infinity,
          child: TextButton(onPressed: (){_addComment(context);}, child: const Text('Add comment')))
      ],
    );
  }
}

class PostPublisher extends StatelessWidget {
  const PostPublisher({ Key? key, required this.user }) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.only(top: 5.0, left: 4, right: 4),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserDetails(
                              user: user,
                            )));
              },
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.brown[200],
                ),
                child: SizedBox(
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.person,
                          size: 50,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text('${user.username}', style: const TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text('${user.name}', style: const TextStyle(fontWeight: FontWeight.bold)),
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

class PostFull extends StatelessWidget {
  const PostFull({ Key? key, required this.post }) : super(key: key);
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only( left: 4, right: 4),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.brown[200],
            boxShadow: [
              
                    BoxShadow(
                      offset: const Offset(0, 0),
                      blurRadius: 3,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ],
          ),
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text('${post.title}', style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text('${post.body}', overflow: TextOverflow.fade, ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }
}