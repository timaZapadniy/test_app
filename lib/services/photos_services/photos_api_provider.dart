import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_app/model/album.dart';
import 'package:test_app/model/photo.dart';

class PhotosProvider {
  //late Box box1;

  Future fetchPhotos({required int albumId}) async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos?albumId=$albumId'));
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      
      List i = [];
      i = parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
     
      return i;
    } else {
      throw Exception('Failed to load photos');
    }
  }

}