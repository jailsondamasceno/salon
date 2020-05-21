class Service {
  String _providerId;
  String _serviceName;
  String _description;
  String _urlImage;
  String _price;
  bool _atHome;

  Service();

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "idProvider": this._providerId,
      "serviceName": this._serviceName,
      "description": this._description,
      "urlImage": this._urlImage,
      "price": this._price,
      "atHome": this._atHome
    };
    return map;
  }

  String get idProvider => _providerId;

  set idProvider(String value) {
    _providerId = value;
  }

  String get serviceName => _serviceName;

  set serviceName(String value) {
    _serviceName = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get urlImage => _urlImage;

  set urlImage(String value) {
    _urlImage = value;
  }

  String get price => _price;

  set price(String value) {
    _price = value;
  }

  bool get atHome => _atHome;

  set atHome(bool value) {
    _atHome = value;
  }
}
