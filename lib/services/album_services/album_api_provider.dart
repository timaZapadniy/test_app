import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_app/model/album.dart';

class AlbumProvider {
  //late Box box1;

  Future fetchAlbums({required int userId}) async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums?userId=$userId'));
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      
      List i = [];
      i = parsed.map<Album>((json) => Album.fromJson(json)).toList();
     
      return i;
    } else {
      throw Exception('Failed to load users');
    }
  }

}