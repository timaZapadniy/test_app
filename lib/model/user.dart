import 'address.dart';
import 'company.dart';

class User {
  final int id;
  final String? name, username, email, phone, website;
  final Company? company;
  final Address? address;

  User(
      {
      required this.id,
      this.name,
      this.username,
      this.email,
      this.phone,
      this.website,
      this.company,
      this.address});
  
    factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      website: json['website'],
      address: Address.fromJson(json['address']),
    );
  }
}

// ignore: non_constant_identifier_names
List<User> demo_users = [
  User(
    id: 1,
      name: 'timur',
      username: 'ainger',
      email: 'timurkaka8@gmail.com',
      phone: '79225012928',
      website: 'timur-natasha.ru',
      company: Company(
          name: 'mk',
          catchPhrase: 'Multi-layered client-server neural-net',
          bs: 'harness real-time e-markets'),
      address:
          Address(street: '1', suite: '2', city: '3', zipcode: '5', geo: '6')),
  User(
    id: 2,
      name: 'timur1',
      username: 'ainger1',
      email: 'timurkaka8@gmail.com',
      phone: '79225012928',
      website: 'timur-natasha.ru',
      company: Company(
          name: 'mk',
          catchPhrase: 'Multi-layered client-server neural-net',
          bs: 'harness real-time e-markets'),
      address:
          Address(street: '1', suite: '2', city: '3', zipcode: '5', geo: '6')),
  User(
    id: 3,
      name: 'timur2',
      username: 'ainger2',
      email: 'timurkaka8@gmail.com',
      phone: '79225012928',
      website: 'timur-natasha.ru',
      company: Company(
          name: 'mk',
          catchPhrase: 'Multi-layered client-server neural-net',
          bs: 'harness real-time e-markets'),
      address:
          Address(street: '11121212123123123123123123123123123123123124sqfqfqfefwefwefewfwe3213123412412412412412', suite: '2', city: '3', zipcode: '5', geo: '6')),
];
