import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import '../models/item_model.dart';

class MovieApiProvider {
  Client client = Client();

  static final _api_key = '5d5b4588dc71d0e50c29f2caa9221fa0';
  final url = 'http://api.themoviedb.org/3/movie/popular?api_key=$_api_key';

  Future<ItemModel> fetchMovieList() async {

    print("entered");
    final response = await client
      .get(url);

    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }

  }


}