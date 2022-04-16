class Company {
  final String? name, catchPhrase, bs;

  Company({this.name, this.catchPhrase, this.bs,});
  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      name: json['name'],
      catchPhrase: json['catchPhrase'],
      bs: json['bs']
    );
  }
}

