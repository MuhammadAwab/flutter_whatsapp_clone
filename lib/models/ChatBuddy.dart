class ChatBuddy{
  String _name;
  String _image;
  String _lastMessage;
  String _lastTimeStamp;

  ChatBuddy(this._name, this._image, this._lastMessage, this._lastTimeStamp);

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get image => _image;

  set image(String value) {
    _image = value;
  }

  String get lastMessage => _lastMessage;

  set lastMessage(String value) {
    _lastMessage = value;
  }

  String get lastTimeStamp => _lastTimeStamp;

  set lastTimeStamp(String value) {
    _lastTimeStamp = value;
  }
}