import 'package:flutter/material.dart';

class HeaderButton extends StatelessWidget {
  const HeaderButton({ Key? key, this.onTap, this.text }) : super(key: key);
  final Function()? onTap;
  final String? text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: TextButton(onPressed: onTap?? (){
        // ignore: avoid_print
        print('no func');
      } , child: Text('$text', style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)),
    );
  }
}