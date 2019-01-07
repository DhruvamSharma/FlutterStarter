import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:places/models/dog_model.dart';

class DogProvider {

  var client = Client();

  Future<DogModel> getDogImages() async {

    var uri = Uri.http('dog.ceo', '/api/breeds/image/random');

    var response = await client.get(uri);

    if(response.statusCode == 200) {

      return DogModel.fromJson(json.decode(response.body));

    } else {
      throw Exception("error in fetching messages");
    }

  }

}