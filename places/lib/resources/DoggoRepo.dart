import 'package:places/models/dog_model.dart';
import 'package:places/resources/network/dog_provider.dart';

class DoggoRepo {

  final provider = DogProvider();

  Future<DogModel> fetchImage() async {
    DogModel model = await provider.getDogImages();
    return model;
  }

}