import 'package:flutter/material.dart';
import 'package:test_app/model/post.dart';

class PostPreviewItem extends StatelessWidget {
  const PostPreviewItem({ Key? key, required this.post }) : super(key: key);
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, left: 4, right: 4),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF522e23)),
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
           // Navigator.push(context, MaterialPageRoute(builder: (context) =>  UserDetails(user: user,)));
          },
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
                    child: Text('${post.body}', overflow: TextOverflow.fade, maxLines: 1,),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}