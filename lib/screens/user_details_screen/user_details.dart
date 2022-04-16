import 'package:flutter/material.dart';
import 'package:test_app/model/user.dart';

import 'components/address_info.dart';
import 'components/company_info.dart';
import 'components/user_info.dart';
import 'components/user_posts.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({Key? key, required this.user}) : super(key: key);
  final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${user.username}'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserInfo(
            user: user,
          ),
          CompanyInfo(company: user.company,),
          AddressInfo(address: user.address,),
          const UserPosts(),
          
        ],
      ),
    );
  }
}
