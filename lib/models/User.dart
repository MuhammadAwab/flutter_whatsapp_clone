class User{
  String _name;
  String _image;
  String _bio;
  String _phone;


  User(this._name, this._image, this._bio,this._phone);

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get image => _image;

  set image(String value) {
    _image = value;
  }

  String get bio => _bio;

  set bio(String value) {
    _bio = value;
  }

  String get phone => _phone;

  set phone(String value) {
    _phone = value;
  }
}