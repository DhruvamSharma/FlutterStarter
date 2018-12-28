import 'package:rxdart/rxdart.dart';
import 'package:bloc_pattern/src/resources/repository.dart';
import '../models/item_model.dart';

class MoviesBloc {

  final _moviesRepository = Repository();
  final _moviesFetcher = PublishSubject<ItemModel>();

  Observable<ItemModel> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    ItemModel itemModel = await _moviesRepository.fetchAllMovies();
    _moviesFetcher.sink.add(itemModel);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final bloc = MoviesBloc();