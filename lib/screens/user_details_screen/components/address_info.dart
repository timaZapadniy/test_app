import 'package:flutter/material.dart';
import 'package:test_app/model/address.dart';

class AddressInfo extends StatelessWidget {
  const AddressInfo({ Key? key, this.address }) : super(key: key);
  final Address? address;
  @override
  Widget build(BuildContext context) {
    if(address!=null){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Address:'),
            const SizedBox(height: 8,),
            SizedBox(child: Text('${address!.city}, ${address!.street} st., ${address!.suite}', maxLines: 5,)),
            
          ],
        )
    ),
      );
    }else{
      return const Text('Адрес не указан');
    }
    
  }
}