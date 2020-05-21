class User {
  String _userId;
  String _name;
  String _urlImage;
  String _gender;
  String _country;
  String _address;
  String _birth;
  String _email;
  String _password;

  User();

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "userId": this._userId,
      "name": this._name,
      "urlImage": this._urlImage,
      "gender": this._gender,
      "country": this._country,
      "address": this._address,
      "birth": this._birth,
      "email": this._email,
      "password": this._password
    };
    return map;
  }

  String get userId => _userId;

  set userId(String value) {
    _userId = value;
  }


  String get name => _name;

  set name(String value) {
    _name = value;
  }


  String get urlImage => _urlImage;

  set urlImage(String value) {
    _urlImage = value;
  }


  String get gender => _gender;

  set gender(String value) {
    _gender = value;
  }


  String get country => _country;

  set country(String value) {
    _country = value;
  }
  

  String get address => _address;

  set address(String value) {
    _address = value;
  }


  String get birth => _birth;

  set birth(String value) {
    _birth = value;
  }


  String get email => _email;

  set email(String value) {
    _email = value;
  }


  String get password => _password;

  set password(String value) {
    _password = value;
  }
}
