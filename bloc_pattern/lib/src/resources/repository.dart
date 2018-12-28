import '../models/item_model.dart';
import 'package:bloc_pattern/src/resources/movie_api_provider.dart';

class Repository {
  final movieApiProvider = MovieApiProvider();

  Future<ItemModel> fetchAllMovies() => movieApiProvider.fetchMovieList();

}