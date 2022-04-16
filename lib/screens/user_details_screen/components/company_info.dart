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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Working:'),
            const SizedBox(height: 8,),
            Text('${company!.name}'),
            Text('${company!.bs}'),
            Text('${company!.catchPhrase}'),
          ],
        )
    ),
      );
    }else{
      return const Text('Компания не указана');
    }
    
  }
}