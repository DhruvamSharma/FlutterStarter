class DogModel {
  String _name;
  String _location;

  String get name => _name;
  String _description;
  String _imageUrl;
  int _rating = 10;

  DogModel(this._name, this._description, this._location);


  DogModel.fromJson(Map<String, dynamic> data) {
    this._imageUrl = data['message'];
  }

  String get location => _location;

  String get description => _description;

  String get imageUrl => _imageUrl;

  int get rating => _rating;


}