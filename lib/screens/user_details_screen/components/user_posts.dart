import 'package:flutter/cupertino.dart';
import 'package:test_app/model/post.dart';
import 'package:test_app/screens/post_list_screen/post_item.dart';

class UserPosts extends StatelessWidget {
  const UserPosts({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
          itemCount: demo_posts.length>=3? 3 : demo_posts.length,
          itemBuilder: (context, index){
            return PostPreviewItem(post: demo_posts[index],);
          }),
    );
  }
}