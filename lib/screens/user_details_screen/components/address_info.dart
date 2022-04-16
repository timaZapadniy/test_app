import 'package:flutter/material.dart';
import 'package:test_app/model/address.dart';

class AddressInfo extends StatefulWidget {
  const AddressInfo({ Key? key, this.address}) : super(key: key);
  final Address? address;
  @override
  State<AddressInfo> createState() => _AddressInfoState();
}

class _AddressInfoState extends State<AddressInfo> {
  late Address? _address;
  bool isHide = true;

  void openMore(){
    setState(() {
      isHide = !isHide;
    });
    
  }

  @override
  void initState() {
    _address = widget.address;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  if(_address!=null){
      return Padding(
        padding: const EdgeInsets.only(left:8.0, right: 8, bottom: 8),
        child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFF522e23)),
          borderRadius: BorderRadius.circular(5),
        ),
          child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                     const Text('Address:', style: TextStyle(fontWeight: FontWeight.bold),),
                     const Spacer(),
                     SizedBox(
                       height: 30,
                       child: TextButton(onPressed:(){openMore();} , child: const Text('See more...', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),)))
                  ],
                ),
                SizedBox(child: Text('${_address!.city}, ${_address!.street} st., ${_address!.suite}',)),
                if(!isHide) const SizedBox(height: 4,),
                if(!isHide)SizedBox(child: Text('lat: ${_address!.geo!.lat}, lng: ${_address!.geo!.lng}')),
              ],
            ),
          )
    ),
        ),
      );
    }else{
      return const Text('Адрес не указан');
    }
    
  }
}
