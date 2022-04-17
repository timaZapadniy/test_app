import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/comments_bloc/comments_bloc.dart';

class AddComment extends StatefulWidget {
  const AddComment({Key? key, required this.postId}) : super(key: key);
  final int postId;
  @override
  State<AddComment> createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CommentsBloc usersBloc = BlocProvider.of<CommentsBloc>(context);
    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: BlocBuilder<CommentsBloc, CommentsState>(
        builder: (context, state) {
        if (state is CommentsInitial) {
        return const SizedBox();
      }

      if (state is LoadingCommentsState) {
        return const SizedBox(
          height: 200,
          child: Center(child: CircularProgressIndicator()));
      }
      if (state is LoadedCommentsState) {
        
        return Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Add comment',
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF522e23),
                  fontWeight: FontWeight.bold),
            ),
          ),
          InputField(
            controller: _nameController,
            hint: 'Name',
          ),
          InputField(
            controller: _emailController,
            hint: 'Email',
          ),
          InputField(
            controller: _commentController,
            hint: 'Comment',
            maxLines: 5,
          ),
          DecoratedBox(
            decoration: const BoxDecoration(color: Color(0xFFe1dacc)),
            child: SizedBox(
                width: double.infinity,
                child: TextButton.icon(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    usersBloc.add(AddCommentEvent(
                        comment: _commentController.text,
                        email: _emailController.text,
                        name: _nameController.text, postId: widget.postId,));
                  },
                  label: const Text('Send comment'),
                )),
          )
        ],
      );
      }

      if (state is CommentsAddedState) {
        return Column(
          children: [
            const SizedBox(
              height: 180,
              child: Center(child: Icon(Icons.done, size: 80, color: Colors.green,))),
            DecoratedBox(
          decoration: const BoxDecoration(color: Color(0xFFe1dacc)),
          child: Row(
            children: [
              Expanded(
                  
                  child: TextButton.icon(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      usersBloc.add(GetCommentsEvent(postId: widget.postId));
                    },
                    label: const Text('New comment'),
                  )),
               Expanded(
                  
                  child: TextButton.icon(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    label: const Text('Back'),
                  )),
            ],
          ),
        )
          ],
        );
      }

      if (state is ErrorLoadCommentsState) {
        return const Center(child: Center(child: Text('')));
      }
      return const SizedBox();
    })
      
      
    );
  }
}

class InputField extends StatelessWidget {
  const InputField(
      {Key? key, required this.controller, this.maxLines, this.hint})
      : super(key: key);
  final TextEditingController controller;
  final int? maxLines;
  final String? hint;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        minLines: maxLines ?? 1,
        maxLines: maxLines ?? 1,
        decoration: InputDecoration(
          fillColor: Colors.black,
          focusColor: Colors.black,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF522e23), width: 2),
              borderRadius: BorderRadius.all(Radius.circular(4.0))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(4.0))),
          labelText: hint ?? '',
        ),
        style: const TextStyle(fontSize: 16),
        controller: controller,
      ),
    );
  }
}
