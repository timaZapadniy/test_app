import 'package:flutter/material.dart';
import 'package:test_app/model/comment.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({ Key? key,required this.comment }) : super(key: key);
  final Comment comment;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
        child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFF522e23)),
          borderRadius: BorderRadius.circular(5),
        ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${comment.email}', style: const TextStyle(fontWeight: FontWeight.bold),),
                Text('${comment.name}', style: const TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(height: 4,),
                Text('${comment.body}', style:const  TextStyle(fontStyle: FontStyle.italic),),
              ],
            ),
          ),
        )
    ),
      );
  }
}