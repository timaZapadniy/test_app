import 'package:flutter/material.dart';
import 'package:test_app/model/company.dart';

class CompanyInfo extends StatelessWidget {
  const CompanyInfo({ Key? key, this.company }) : super(key: key);
  final Company? company;
  @override
  Widget build(BuildContext context) {
    if(company!=null){
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
                const Text('Working:'),
                const SizedBox(height: 8,),
                Text('Name: ${company!.name}'),
                Text('bs: ${company!.bs}'),
                const SizedBox(height: 4,),
                Text('Catch phrase: "${company!.catchPhrase}"', style:const  TextStyle(fontStyle: FontStyle.italic),),
              ],
            ),
          ),
        )
    ),
      );
    }else{
      return const Text('Компания не указана');
    }
    
  }
}