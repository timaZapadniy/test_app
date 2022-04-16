class Address {
  final String? street, suite, city, zipcode;
  final Geo? geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      geo: Geo.fromJson(json['geo'])
    );
  }
}
class Geo{
  final String? lat, lng;
  Geo({this.lat, this.lng});
  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(
      lat: json['lat'],
      lng: json['lng']
    );
  }
}