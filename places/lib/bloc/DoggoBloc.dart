import 'package:places/models/dog_model.dart';
import 'package:places/resources/DoggoRepo.dart';

class DoggoBloc{

  final repo = DoggoRepo();

  Future<DogModel> fetchDogs() async{
    DogModel model = await repo.fetchImage();
    return model;
  }


}

final bloc = DoggoBloc();